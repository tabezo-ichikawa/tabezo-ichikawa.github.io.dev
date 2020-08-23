import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabezo_web/config/paragraphs.dart';
import 'package:tabezo_web/widgets/responsive.dart';

class AboutParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myTextTheme = Theme.of(context).textTheme;
    final myParagraphs = Paragraphs(context);

    return Container(
      //
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Who we are:',
              style: Responsive.isDesktop(context)
                  ? myTextTheme.headline3
                  : myTextTheme.headline5,
            ),
            const TextSpan(
              text: "\n",
            ),
            myParagraphs.whoWeAre,
            const TextSpan(
              text: "\n\n\n",
            ),
            TextSpan(
              text: 'What we do:',
              style: Responsive.isDesktop(context)
                  ? myTextTheme.headline3
                  : myTextTheme.headline5,
            ),
            const TextSpan(
              text: "\n",
            ),
            myParagraphs.whatWeDo,
            const TextSpan(
              text: "\n\n\n",
            ),
            TextSpan(
              text: 'What you can do:',
              style: Responsive.isDesktop(context)
                  ? myTextTheme.headline3
                  : myTextTheme.headline5,
            ),
            const TextSpan(
              text: "\n",
            ),
            myParagraphs.whatYouCanDo,
            const TextSpan(
              text: "\n",
            ),
          ],
        ),
      ),
    );
  }
}
