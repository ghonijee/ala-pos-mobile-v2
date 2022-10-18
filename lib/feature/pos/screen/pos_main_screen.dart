import 'package:ala_pos/shared/widget/form/text_form_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:primer_flutter/primer_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PosMainScreen extends StatelessWidget {
  const PosMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primeTheme = PrimerTheme.of(context);

    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        toolbarHeight: 56.px,
        backgroundColor: primeTheme.canvas.dflt,
        elevation: 0,
        leading: Icon(
          FeatherIcons.menu,
          color: primeTheme.foreground.dflt,
        ),
        actions: [
          InkWell(
            child: Icon(
              FeatherIcons.camera,
              color: primeTheme.foreground.dflt,
            ),
          ),
          SizedBox(
            width: 16.sp,
          ),
        ],
        title: Container(
          height: 46.px,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              prefixIcon: Icon(
                FeatherIcons.search,
                color: primeTheme.foreground.dflt,
                size: 20.px,
              ),
              hintText: "Cari produk...",
              filled: true,
              fillColor: primeTheme.canvas.inset,
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: primeTheme.border.dflt)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: primeTheme.border.subtle)),
            ),
          ),
        ),
      ),
      backgroundColor: primeTheme.canvas.inset,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: primeTheme.brand.quaternary,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: primeTheme.brand.primary,
                  ),
                ),
                child: Text("Makanan"),
              )
            ],
          )
        ],
      )),
    );
  }
}
