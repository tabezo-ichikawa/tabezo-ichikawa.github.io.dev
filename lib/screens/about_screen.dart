import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tabezo_web/config/palette.dart';
import 'package:tabezo_web/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
        drawer: _getDrawer(context),
        appBar: MyAppBar(
          preferredSize: Size(screenSize.width, 140),
          scaffoldKey: _scaffoldKey,
          sideAreaWidth: sideAreaWidth,
        ),
        body: _AboutScreen(scrollController: _trackingScrollController),
      ),
    );
  }

  Drawer _getDrawer(BuildContext context) {
    return Drawer(
      child: Material(
        color: Palette.tabezoYellow,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(
                      color: Palette.tabezoBlue,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Palette.tabezoBlue,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'More info',
                    style: TextStyle(
                      color: Palette.tabezoBlue,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationLegalese:
                      'Visit our Github for the source code of this page.',
                  children: [
                    InkWell(
                      child: const Icon(
                        MdiIcons.github,
                        size: 40,
                      ),
                      onTap: () async {
                        if (await canLaunch(
                            'https://github.com/tabezo-ichikawa/tabezo-ichikawa.github.io.dev')) {
                          await launch(
                              'https://github.com/tabezo-ichikawa/tabezo-ichikawa.github.io.dev');
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
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
