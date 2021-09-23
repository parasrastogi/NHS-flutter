import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/view/screens/landing/photos_page.dart';
import 'package:newhomesource/view/screens/landing/save_page.dart';
import 'package:newhomesource/view/screens/landing/search_page.dart';
import 'package:newhomesource/view/screens/tab_items.dart';

import 'more/user_dashboard.dart';
import 'landing/notes_page.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  final TabItems currentTabItem;
  final ValueChanged<TabItems> onSelectTab;
  final Map<TabItems, GlobalKey<NavigatorState>> navigatorKeys;
  final Color _inactiveColor = Colors.black54;
  final Color _activeColor = Color(0xff0079D2);
  CupertinoHomeScaffold(
      {required this.currentTabItem,
      required this.onSelectTab,
      required this.navigatorKeys});

  Map<TabItems, WidgetBuilder> get widgetBuilder {
    return {
      TabItems.notes: (_) => NotesPage(),
      TabItems.saved: (_) => SavePage(),
      TabItems.search: (_) => SearchPage(),
      TabItems.photos: (_) => PhotosPage(),
      TabItems.more: (_) => UserDashBoard()
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _navBarItems(),
          onTap: (index) => onSelectTab(TabItems.values[index]),
        ),
        tabBuilder: (context, index) {
          var item = TabItems.values[index];
          return CupertinoTabView(
            navigatorKey: navigatorKeys[item],
            builder: (context) {
              return widgetBuilder[item]!(context);
            },
          );
        });
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          size: 28,
        ),
        label: 'Saved',
      ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/notes.png',
              color: TabItems.notes == currentTabItem
                  ? _activeColor
                  : _inactiveColor,
              width: 28,
              height: 28),
          label: 'Notes'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 28,
          ),
          label: 'Search'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/photos.png',
              color: TabItems.photos == currentTabItem
                  ? _activeColor
                  : _inactiveColor,
              width: 28,
              height: 28),
          label: 'Photos'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz,
            size: 28,
          ),
          label: 'More')
    ];
  }
}
