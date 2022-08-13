import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<CustomDropdownMenuItem> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final bool underline;

  const CustomDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText = "",
      this.borderRadius = 8,
      this.borderWidth = 1,
      this.maxListHeight = 100,
      this.defaultSelectedIndex = -1,
      Key? key,
      this.enabled = true,
      this.underline = true})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  Widget? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
        });
      }
      if (widget.defaultSelectedIndex > -1) {
        if (widget.defaultSelectedIndex < widget.items.length) {
          if (mounted) {
            setState(() {
              _isAnyItemSelected = true;
              _itemSelected = widget.items[widget.defaultSelectedIndex];
              widget.onChanged(widget.items[widget.defaultSelectedIndex].value);
            });
          }
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(_overlayEntry);
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
      _overlayEntry.remove();
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    _renderBox = context.findRenderObject() as RenderBox?;

    var size = _renderBox!.size;

    dropDownOffset = getOffset();

    return OverlayEntry(
        maintainState: false,
        builder: (context) => Align(
              alignment: Alignment.center,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: dropDownOffset,
                child: SizedBox(
                  height: widget.maxListHeight,
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: _isReverse ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(maxHeight: widget.maxListHeight, maxWidth: size.width),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.symmetric(vertical: BorderSide(width: 1, color: Colors.grey)),
                          borderRadius: BorderRadius.circular(widget.borderRadius),
                        ),
                        child: Material(
                          elevation: 1.0,
                          child: ListView(
                            padding: EdgeInsets.all(AppSpacings.xs),
                            shrinkWrap: true,
                            children: widget.items
                                .map((item) => GestureDetector(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: AppSpacings.m, horizontal: AppSpacings.s),
                                        child: item.child,
                                      ),
                                      onTap: () {
                                        if (mounted) {
                                          setState(() {
                                            _isAnyItemSelected = true;
                                            _itemSelected = item.child;
                                            _removeOverlay();
                                            if (widget.onChanged != null) widget.onChanged(item.value);
                                          });
                                        }
                                      },
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Offset getOffset() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    double y = renderBox!.localToGlobal(Offset.zero).dy;
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    if (spaceAvailable > widget.maxListHeight) {
      _isReverse = false;
      return Offset(0, renderBox.size.height);
    } else {
      _isReverse = true;
      return Offset(0, renderBox.size.height - (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight = MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
                _isOpen ? _removeOverlay() : _addOverlay();
              }
            : null,
        child: Container(
          decoration: _getDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: _isAnyItemSelected
                    ? Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: _itemSelected!,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 4.0), // change it here
                        child: Text(
                          widget.hintText,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
              ),
              _isAnyItemSelected
                  ? Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isAnyItemSelected = false;
                            _itemSelected = null;
                            widget.onChanged(null);
                          });
                        },
                        child: Icon(
                          Icons.close_outlined,
                          size: 18,
                        ),
                      ),
                    )
                  : Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Decoration? _getDecoration() {
    if (_isOpen && !_isReverse) {
      return BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadius),
              topRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (_isOpen && _isReverse) {
      return BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.borderRadius),
              bottomRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (!_isOpen && widget.underline) {
      return BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1.0,
          color: Colors.grey,
        )),
        // borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      );
    } else if (!_isOpen) {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      );
    }
  }
}

class CustomDropdownMenuItem<T> extends StatelessWidget {
  final T value;
  final Widget child;

  const CustomDropdownMenuItem({required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
