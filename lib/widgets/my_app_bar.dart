import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tabezo_web/config/palette.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double sideAreaWidth;
  final String japTitle;
  final String engTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  final Size preferredSize;

  const MyAppBar({
    Key key,
    @required this.sideAreaWidth,
    @required this.japTitle,
    @required this.engTitle,
    @required this.scaffoldKey,
    @required this.preferredSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        child: Row(
          children: [
            Container(
              width: sideAreaWidth,
              padding: EdgeInsets.symmetric(horizontal: sideAreaWidth / 3),
              child: InkWell(
                child: const Icon(
                  MdiIcons.menu,
                  color: Palette.tabezoBlue,
                ),
                onTap: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
            // TitleParagraph()内のAuto size textがConstraintsがないと働かないので、
            // Expandedする
            Expanded(
              child: Container(
                child: _TitleParagraph(
                  japTitle: japTitle,
                  engTitle: engTitle,
                ),
              ),
            ),
            // 位置調整
            SizedBox(
              width: sideAreaWidth / 6,
            ),
          ],
        ),
        color: Colors.transparent,
      ),
    );
  }
}

class _TitleParagraph extends StatelessWidget {
  final String japTitle;
  final String engTitle;

  const _TitleParagraph({
    Key key,
    @required this.japTitle,
    @required this.engTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            japTitle,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: GoogleFonts.sawarabiMincho(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                color: Palette.tabezoBlue,
                fontSize: 15,
              ),
            ),
          ),
          AutoSizeText(
            engTitle,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: GoogleFonts.fasterOne(
              textStyle: const TextStyle(
                letterSpacing: 10,
                color: Palette.tabezoBlue,
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
