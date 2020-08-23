import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tabezo_web/config/palette.dart';

class TitleParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            '市川たべ蔵',
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
            'tabezo ichikawa',
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
