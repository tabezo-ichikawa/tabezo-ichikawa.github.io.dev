import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

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
          // image: NetworkImage(
          //     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          image: const AssetImage(
              'assets/images/IMG_5277.JPG'), // full path was needed
          fit: BoxFit.cover,
        ),

        Scrollbar(
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              // SliverPadding(
              //   padding: const EdgeInsets.all(0),
              //   sliver: SliverToBoxAdapter(
              //     child: Container(
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(horizontal: sideAreaWidth),
              //         child: TitleParagraph(),
              //       ),
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: sideAreaWidth),
                sliver: LogoLinkSliverGrid(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
