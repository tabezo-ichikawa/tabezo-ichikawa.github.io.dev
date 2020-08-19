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
          padding: const EdgeInsets.only(top: 140),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: screenSize.height,
                maxWidth: screenSize.width,
              ),
              child: Center(
                heightFactor: 0.4,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(sideAreaWidth, 0, sideAreaWidth, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.spotify,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.apple,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.instagram,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.twitter,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.youtube,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: LogoLink(
                              logoSize: null,
                              icon: MdiIcons.discord,
                              logoColor: Colors.black,
                              url: null,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
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
                      Container(
                        child: AutoSizeText(
                          'We make music,\ndesign and code, de\nyaraseteitadaiteorimasu.',
                          style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            letterSpacing: 10,
                          )),
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
