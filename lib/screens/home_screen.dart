import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import '../models/post_model.dart';

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Messanger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
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
    final double logoSize = screenSize.width / 5;

    // FIXME: いったんビデオのテストをするためにreturn
    return Container(
      child: BackGroundVideo(),
    );

    return Container(
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
              LogoLink(
                logoSize: logoSize,
                icon: MdiIcons.spotify,
                url:
                    'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=VCVJs41hRpqpRNwYqV_mow',
                logoColor: Colors.black87,
              ),
            ],
          ),
        ],
      ),
      // DEBUG
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 8.0,
        ),
        // image: DecorationImage(
        //   image: NetworkImage(
        //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
      // ~DEBUG
    );
  }
}
