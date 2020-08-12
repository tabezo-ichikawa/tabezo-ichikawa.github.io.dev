import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function() onTap;

  const CustomAppBar({
    Key key,
    @required this.currentUser,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              child: Icon(
                MdiIcons.menu,
                //size: 10,
                color: Colors.black,
              ),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
