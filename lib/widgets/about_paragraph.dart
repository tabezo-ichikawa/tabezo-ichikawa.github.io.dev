import 'package:flutter/material.dart';

class AboutParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //
      child: RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Who we are:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              TextSpan(
                text: "\n",
              ),
              TextSpan(
                text: 'Music and video and ...something creator(s) '
                    'and software developpers '
                    'currently based in Hamamatsu city, Japan.',
              ),
              TextSpan(
                text: "\n\n",
              ),
              TextSpan(
                text: 'What we do:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              TextSpan(
                text: "\n",
              ),
              TextSpan(
                text:
                    "It's a tricky thing to have a half-hearted creativity, and in contrast, it makes life void...."
                    "If you create something on impulse and then throw it into the ocean of the internet, what will it become...."
                    "Because there's no way to keep it going in front of work, love, family, Youtube, and Netflix, to the extent that you can't stand up to it at all."
                    "But what if we got together and piled on top of each other?"
                    "The circle of water that each pitch brings to the table could be something else, overlapping with each other. At least that's what Huygens' principle is saying."
                    "That's what we are trying to do.",
              ),
              TextSpan(
                text: "\n\n",
              ),
              TextSpan(
                text: 'What you can do:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              TextSpan(
                text: "\n",
              ),
              TextSpan(
                text: "It's a tricky thing to have a half-hearted creativity, and in contrast, it makes life void...."
                    "If you create something on impulse and then throw it into the ocean of the internet, what will it become...."
                    "Because there's no way to keep it going in front of work, love, family, Youtube, and Netflix, to the extent that you can't stand up to it at all."
                    "But what if we got together and piled on top of each other?"
                    "The circle of water that each pitch brings to the table could be something else, overlapping with each other. At least that's what Huygens' principle is saying."
                    "That's what we are trying to do.",
              ),
            ]),
      ),
    );
  }
}
