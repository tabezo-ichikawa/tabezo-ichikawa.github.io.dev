import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'logo_link.dart';

class LogoLinkSliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.spotify,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.apple,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.youtube,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.instagram,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.discord,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const LogoLink(
            logoSize: null,
            icon: MdiIcons.twitter,
            logoColor: Colors.black87,
            url:
                'https://open.spotify.com/artist/0kA6hiWjtnojSctZTgFAs2?si=K1mAggmMRR-syoPPhZu9Nw',
          ),
        ),
      ],
    );
  }
}
