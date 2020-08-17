import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabezo_web/config/paragraphs.dart';

class AboutParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textStyle = DefaultTextStyle.of(context).style;

    return Container(
      //
      child: RichText(
        text: TextSpan(
          style: _textStyle.merge(
            const TextStyle(
              height: 1.4,
            ),
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Who we are:',
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const TextSpan(
              text: "\n",
            ),
            Paragraphs.whoWeAre,
            const TextSpan(
              text: "\n\n\n",
            ),
            TextSpan(
              text: 'What we do:',
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const TextSpan(
              text: "\n",
            ),
            Paragraphs.whatWeDo,
            const TextSpan(
              text: "\n\n\n",
            ),
            TextSpan(
              text: 'What you can do:',
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const TextSpan(
              text: "\n",
            ),
            Paragraphs.whatYouCanDo,
            const TextSpan(
              text: "\n",
            ),
          ],
        ),
      ),
    );
  }
}
