import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TitleParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              '市川たべ蔵',
              maxLines: 1,
              textAlign: TextAlign.left,
              style: GoogleFonts.sawarabiMincho(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const AutoSizeText(
              'Tabezo Ichikawa',
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            const AutoSizeText(
              'Music and video and ...something creator(s) currently based in Hamamatsu city, Japan.',
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
