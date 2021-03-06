import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Paragraphs {
  BuildContext curContext;
  TextSpan whoWeAre, whatWeDo, whatYouCanDo;

  Paragraphs(BuildContext context) {
    // ignore: prefer_initializing_formals
    curContext = context;
    whoWeAre = TextSpan(
      text: 'Music and video and ...something creators '
          'and software developpers '
          'currently based in Hamamatsu city, Japan.',
      style: Theme.of(context).textTheme.bodyText1,
    );

    whatWeDo = TextSpan(
      text:
          "It's a tricky thing to have a half-hearted creativity, and in contrast, it makes life void.... "
          "If you create something on impulse and then throw it into the ocean of the internet, what will it become...? "
          "There's no way to keep it going in front of work, relationship, family, Youtube, and Netflix. We can't stand up to them at all. "
          "But what if we get together and piled on top of each other? "
          "The circle of water that each pitch brings to the ocean could be something else, overlapping with each other. At least that's what Huygens' principle is saying. "
          "That's what we are trying to do.",
      style: Theme.of(context).textTheme.bodyText1,
    );

    whatYouCanDo = TextSpan(
      style: Theme.of(context).textTheme.bodyText1,
      children: <TextSpan>[
        TextSpan(
          text: 'As an art lover: ',
          style: Theme.of(context).textTheme.bodyText1.merge(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        TextSpan(
          text:
              "Enjoy our works when you have time. \n",
        ),
        TextSpan(
          text: 'As a creator: ',
          style: Theme.of(context).textTheme.bodyText1.merge(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        TextSpan(
          text: "If you think you're in the same situation with us, join our ",
        ),
        TextSpan(
          text: 'Discord server',
          style: Theme.of(context).textTheme.bodyText1.merge(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (await canLaunch('https://discord.com/invite/Cn8sn7R')) {
                await launch('https://discord.com/invite/Cn8sn7R');
              } else {
                print('url launch failed');
              }
            },
        ),
        const TextSpan(
          text:
              ". We hang out there so we can share thoughts and maybe collaborate!\n\n\n",
        ),
      ],
    );
  }
}
