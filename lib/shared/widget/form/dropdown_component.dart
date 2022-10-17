// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:primer_flutter/primer_flutter.dart';

import '../../styles/styles.dart';

class DropdownComponent<T> extends StatefulWidget {
  final List<DropdownComponentMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final String labelText;
  final String? errorText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final bool underline;
  bool? isValid;

  DropdownComponent({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hintText = "",
    this.labelText = "",
    this.errorText,
    this.borderRadius = 8,
    this.maxListHeight = 100,
    this.borderWidth = 1,
    this.defaultSelectedIndex = -1,
    this.enabled = true,
    this.underline = true,
    this.isValid = true,
  }) : super(key: key);

  @override
  _DropdownComponentState createState() => _DropdownComponentState<T>();
}

class _DropdownComponentState<T> extends State<DropdownComponent<T>> with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  Widget? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();
  late PrimerThemeData primeTheme;
  late Color _color;

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
              widget.onChanged.call(widget.items[widget.defaultSelectedIndex].value);
            });
          }
        }
      }
    });
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      primeTheme = PrimerTheme.of(context);
      _color = primeTheme.border.dflt;
    });
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
                                        padding: EdgeInsets.symmetric(vertical: AppSpacings.m, horizontal: AppSpacings.m),
                                        child: item.child,
                                      ),
                                      onTap: () {
                                        if (mounted) {
                                          setState(() {
                                            _isAnyItemSelected = true;
                                            _itemSelected = item.child;
                                            _removeOverlay();
                                            widget.onChanged.call(item.value);
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
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.enabled
                ? () {
                    _isOpen ? _removeOverlay() : _addOverlay();
                    print(_isOpen);
                  }
                : null,
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: _getDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: _isAnyItemSelected
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.labelText.isNotEmpty
                                  ? Text(
                                      widget.labelText,
                                      style: primeTheme.typography.small.copyWith(
                                        color: primeTheme.foreground.muted,
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: widget.labelText.isNotEmpty ? AppSpacings.xs : 0,
                              ),
                              _itemSelected!,
                            ],
                          )
                        : Text(
                            widget.hintText,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: primeTheme.typography.h4.copyWith(
                              color: primeTheme.foreground.subtle,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),
                  if (_isAnyItemSelected)
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isAnyItemSelected = false;
                            _itemSelected = null;
                            widget.onChanged.call(null);
                          });
                        },
                        child: Icon(
                          Ionicons.close,
                          size: 18,
                          color: primeTheme.foreground.muted,
                        ),
                      ),
                    )
                  else
                    Flexible(
                      flex: 1,
                      child: Icon(
                        size: 18,
                        Ionicons.chevron_down,
                        color: primeTheme.foreground.muted,
                      ),
                    ),
                ],
              ),
            ),
          ),
          widget.isValid!
              ? SizedBox()
              : SizedBox(
                  height: AppSpacings.s,
                ),
          widget.isValid!
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.errorText ?? "-",
                    style: primeTheme.typography.small.copyWith(color: primeTheme.danger.foreground),
                  ),
                )
        ],
      ),
    );
  }

  Decoration? _getDecoration() {
    if (_isOpen && !_isReverse) {
      return BoxDecoration(
          color: primeTheme.canvas.dflt,
          border: Border.all(
            color: widget.isValid! ? _color : primeTheme.danger.foreground,
            width: 1.0,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.borderRadius),
              topRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (_isOpen && _isReverse) {
      return BoxDecoration(
          color: primeTheme.canvas.dflt,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.borderRadius),
              bottomRight: Radius.circular(
                widget.borderRadius,
              )));
    } else if (!_isOpen && widget.underline) {
      return BoxDecoration(
        color: primeTheme.canvas.dflt,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: widget.isValid! ? _color : primeTheme.danger.foreground,
          width: 1.0,
        ),
        // borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      );
    } else if (!_isOpen) {
      return BoxDecoration(
        color: primeTheme.canvas.dflt,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: widget.isValid! ? _color : primeTheme.danger.foreground,
          width: 1.0,
        ),
      );
    }
  }
}

class DropdownComponentMenuItem<T> extends StatelessWidget {
  final T value;
  final Widget child;

  const DropdownComponentMenuItem({required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
