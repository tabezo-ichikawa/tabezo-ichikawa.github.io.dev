import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';
import '../data/data.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _screens = [
    HomeScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;

    return DefaultTabController(
      //FIXME: lengthはページの数で、drawerのメニューの数に対応させなければならない
      length: _icons.length,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _getDrawer(context),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 140),
          child: Container(
            child: Row(
              children: [
                Container(
                  width: sideAreaWidth,
                  padding: EdgeInsets.symmetric(horizontal: sideAreaWidth / 3),
                  child: InkWell(
                    child: Icon(
                      MdiIcons.menu,
                      color: Colors.white,
                      size: sideAreaWidth / 4,
                    ),
                    onTap: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                // TitleParagraph()内のAuto size textがConstraintsがないと働かないので、
                // Expandedする
                Expanded(
                  child: Container(
                    child: TitleParagraph(),
                  ),
                ),
                // 位置調整
                SizedBox(
                  width: sideAreaWidth,
                ),
              ],
            ),
            color: Colors.black,
          ),
        ),
        body: IndexedStack(
          //TODO: 複数ページ扱うとき_selectedIndexをちゃんと管理しないといけない
          index: _selectedIndex,
          children: _screens,
        ),
      ),
    );
  }
}

Drawer _getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text(
            'My App',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
        ListTile(
          title: const Text('Los Angeles'),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
