import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tabezo_web/config/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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