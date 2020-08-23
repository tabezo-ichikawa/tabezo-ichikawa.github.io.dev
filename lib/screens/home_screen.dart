import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabezo_web/config/palette.dart';
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
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;
    final shadowThickness = 1.5;
    final orientation = MediaQuery.of(context).orientation;

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
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: Responsive.isDesktop(context)
                ? EdgeInsets.fromLTRB(sideAreaWidth, 140, sideAreaWidth, 0)
                : EdgeInsets.fromLTRB(sideAreaWidth, 140, sideAreaWidth / 2, 0),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: screenSize.height / 2 - 140,
                maxWidth: screenSize.width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: !Responsive.isMobile(context)
                        ? EdgeInsets.only(bottom: 10)
                        : EdgeInsets.only(bottom: 10),
                    constraints: BoxConstraints(
                      maxHeight: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.spotify,
                            logoColor: Palette.tabezoBlue,
                            url:
                                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=zZj96x64Sq2f6w60mgL8_g',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.apple,
                            logoColor: Palette.tabezoBlue,
                            url:
                                'https://music.apple.com/jp/artist/tabezo-ichikawa/1512798243',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.instagram,
                            logoColor: Palette.tabezoBlue,
                            url: 'https://www.instagram.com/tabezo_ichikawa/',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.twitter,
                            logoColor: Palette.tabezoBlue,
                            url: 'https://twitter.com/TabezoIchikawa',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.youtube,
                            logoColor: Palette.tabezoBlue,
                            url:
                                'https://www.youtube.com/channel/UCFq3dShoeK4xZfqAffgY_IQ?view_as=subscriber',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.discord,
                            logoColor: Palette.tabezoBlue,
                            url: 'https://discord.com/invite/Cn8sn7R',
                          ),
                        ),
                        Container(
                          child: LogoLink(
                            logoSize: !Responsive.isMobile(context) ? null : 18,
                            icon: MdiIcons.github,
                            logoColor: Palette.tabezoBlue,
                            url: 'https://github.com/tabezo-ichikawa',
                          ),
                        ),
                        Responsive.isDesktop(context)
                            ? Container(
                                width: 30,
                                height: 30,
                              )
                            : Container(
                                width: 0,
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: Responsive.isDesktop(context)
                              ? 'We make music, \ndesign and code, de\nYarasete Itadaite Orimasu.'
                              : 'We make music, design and code, de Yarasete Itadaite Orimasu.',
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              fontSize: 72,
                              fontWeight: !Responsive.isMobile(context)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              color: Palette.tabezoBlue,
                              letterSpacing:
                                  !Responsive.isMobile(context) ? 15 : 1,
                            ),
                          ),
                        ),
                        minFontSize: 0,
                        stepGranularity: 0.1,
                        textAlign: TextAlign.left,
                        strutStyle: StrutStyle(
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
