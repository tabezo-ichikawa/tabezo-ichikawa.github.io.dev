import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabezo_web/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              //_HomeScreenMobile(scrollController: _trackingScrollController),
              _HomeScreenDesktop(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double sideAreaWidth = screenSize.width / 6;

    return Stack(
      children: <Widget>[
        // TODO:
        // Video上ではマウスカーソルのホバーエフェクトが動作しないので、現状では背景は静止画しか使えない
        // https://github.com/flutter/flutter/issues/62306
        //BackGroundVideo(),

        // Splashエフェクトを見せるためにはInk.imageで画像を描画する必要がある
        Ink.image(
          image: const AssetImage(
              'assets/images/IMG_5277.JPG'), // full path was needed
          fit: BoxFit.cover,
        ),

        // logo links
        Padding(
          padding: Responsive.isDesktop(context)
              ? EdgeInsets.fromLTRB(sideAreaWidth, 140, sideAreaWidth, 0)
              : EdgeInsets.fromLTRB(sideAreaWidth, 140, sideAreaWidth / 2, 0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: screenSize.height / 3,
              maxWidth: screenSize.width,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.spotify,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.apple,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.instagram,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.twitter,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.youtube,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.discord,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        child: LogoLink(
                          logoSize: null,
                          icon: MdiIcons.github,
                          logoColor: Colors.black,
                          url: null,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: AutoSizeText.rich(
                      TextSpan(
                        text:
                            'We make music,\ndesign and code, de\nYarasete Itadaite Orimasu.',
                        style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            letterSpacing: 10,
                          ),
                        ),
                      ),
                      minFontSize: 0,
                      stepGranularity: 0.1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
