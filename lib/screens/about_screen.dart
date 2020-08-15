import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background image
        // Splashエフェクトを見せるためにはInk.imageで画像を描画する必要がある
        Ink.image(
          image: const AssetImage(
              'assets/images/IMG_5277.JPG'), // full path was needed
          fit: BoxFit.cover,
        ),

        // Profile
        Container(

        )
      ],
      
    );
  }
}