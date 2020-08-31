import 'package:flutter/material.dart';
import 'package:tabezo_web/config/palette.dart';
import 'package:tabezo_web/widgets/widgets.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        drawer: MyDrawer(),
        appBar: MyAppBar(
          preferredSize: Size(screenSize.width, 140),
          japTitle: 'なに？',
          engTitle: 'about',
          scaffoldKey: _scaffoldKey,
          sideAreaWidth: sideAreaWidth,
        ),
        body: _AboutScreen(scrollController: _trackingScrollController),
      ),
    );
  }
}

class _AboutScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _AboutScreen({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;

    return Stack(
      children: <Widget>[
        // Background image
        // Splashエフェクトを見せるためにはInk.imageで画像を描画する必要がある
        // Ink.image(
        //   image: const AssetImage(
        //       'assets/images/IMG_5277.JPG'), // full path was needed
        //   fit: BoxFit.cover,
        // ),

        Ink(
          color: Palette.tabezoYellow,
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
              controller: scrollController,
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
