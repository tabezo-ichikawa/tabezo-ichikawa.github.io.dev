import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LogoLink extends StatelessWidget {
  final double logoSize;
  final IconData icon;
  final Color logoColor;
  final String url;

  const LogoLink({
    Key key,
    @required this.logoSize,
    @required this.icon,
    @required this.logoColor,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(
            icon,
            size: logoSize,
            color: logoColor,
          ),
        ),
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            print('url launch failed');
          }
        },
      ),
    );
  }
}
