import 'package:flutter/material.dart';
import 'package:tabezo_web/widgets/about_paragraph.dart';
import 'package:tabezo_web/widgets/responsive.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;

    return Stack(
      children: <Widget>[
        // Background image
        // Splashエフェクトを見せるためにはInk.imageで画像を描画する必要がある
        Ink.image(
          image: const AssetImage(
              'assets/images/IMG_5277.JPG'), // full path was needed
          fit: BoxFit.cover,
        ),

        Ink(
          color: Colors.white70,
        ),

        // Profile
        Padding(
          padding: EdgeInsets.fromLTRB(
            sideAreaWidth,
            140,
            Responsive.isDesktop(context) ? sideAreaWidth : sideAreaWidth / 2,
            0,
          ),
          child: Center(
            heightFactor: 1.3,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Center(
                child: AboutParagraph(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
