// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../styles/styles.dart';

class AppBarSearchComponent extends StatefulWidget {
  AppBarSearchComponent({
    super.key,
    this.leadingIcon,
    this.leadingOnTap,
    this.hintText,
    this.searchController,
    this.actions,
  });
  Icon? leadingIcon;
  Function()? leadingOnTap;
  Function(String value)? onChange;
  TextEditingController? searchController;
  String? hintText;
  List<Widget>? actions;

  @override
  State<AppBarSearchComponent> createState() => _AppBarSearchComponentState();
}

class _AppBarSearchComponentState extends State<AppBarSearchComponent> {
  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return Container(
      //  height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: primeTheme.canvas.dflt,
      ),
      child: Row(
        children: [
          widget.leadingIcon != null
              ? Row(
                  children: [
                    InkWell(
                      onTap: widget.leadingOnTap,
                      child: widget.leadingIcon,
                    ),
                    Spacing.width(
                      size: 16,
                    ),
                  ],
                )
              : SizedBox(),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: widget.searchController,
                onChanged: widget.onChange,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    color: primeTheme.foreground.dflt,
                    size: 20.px,
                  ),
                  hintText: widget.hintText ?? "Cari disini...",
                  filled: true,
                  fillColor: primeTheme.canvas.inset,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: primeTheme.border.dflt)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: primeTheme.border.subtle)),
                ),
              ),
            ),
          ),
          Spacing.width(
            size: 16,
          ),
          Row(
            children: widget.actions ?? [],
          ),
        ],
      ),
    );
  }
}
