import 'dart:ui';

import 'package:flutter/material.dart';
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
        Container(
          constraints: BoxConstraints(
            maxHeight: screenSize.height,
            maxWidth: screenSize.width,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                        Expanded(
                          child: LogoLink(
                            logoSize: null,
                            icon: MdiIcons.spotify,
                            logoColor: Colors.black,
                            url: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

        // Scrollbar(
        //   child: CustomScrollView(
        //     primary: false,

        //     slivers: <Widget>[

        //       SliverPadding(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: sideAreaWidth,
        //           vertical: 0,
        //         ),
        //         sliver: LogoLinkSliverGrid(
        //           sideAreaWidth: sideAreaWidth,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
