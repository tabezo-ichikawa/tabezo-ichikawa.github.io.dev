import 'package:flutter/material.dart';
import 'package:tabezo_web/screens/home_screen.dart';
import 'package:tabezo_web/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _screens = [
    HomeScreen(),
    Container(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sideAreaWidth = screenSize.width / 6;

    return DefaultTabController(
      //FIXME: lengthはページの数で、drawerのメニューの数に対応させなければならない
      length: _screens.length,
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
                  width: sideAreaWidth / 6,
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

  // TODO: mapかなにかでlistの数だけdrawerのメニューを出すようにできる
  Drawer _getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // const DrawerHeader(
          //   child: Text(
          //     'My App',
          //     style: TextStyle(
          //       fontSize: 24,
          //       color: Colors.white,
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //   ),
          // ),
          SizedBox(
            height: 100,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Home'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              setState(
                () => _selectedIndex = 0,
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('About'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              setState(
                () => _selectedIndex = 1,
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('More info'),
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
    );
  }
}
