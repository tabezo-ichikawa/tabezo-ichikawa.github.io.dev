import 'package:flutter/material.dart';
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
              fontFamily: 'DejavuMono',
            ),
          ),
          children: <TextSpan>[
            const TextSpan(
              text: 'Who we are:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'DejavuMono',
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
            const TextSpan(
              text: 'What we do:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'DejavuMono',
              ),
            ),
            const TextSpan(
              text: "\n",
            ),
            Paragraphs.whatWeDo,
            const TextSpan(
              text: "\n\n\n",
            ),
            const TextSpan(
              text: 'What you can do:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'DejavuMono',
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
