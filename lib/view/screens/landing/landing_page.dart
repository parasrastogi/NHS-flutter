import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newhomesource/view/screens/tab_items.dart';
import 'cupertino_home_scaffold.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  bool isHidden = false;
  TabItems _currentTab = TabItems.search;

  final Map<TabItems, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItems.saved: GlobalKey<NavigatorState>(),
    TabItems.notes: GlobalKey<NavigatorState>(),
    TabItems.search: GlobalKey<NavigatorState>(),
    TabItems.photos: GlobalKey<NavigatorState>(),
    TabItems.more: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress ||
            await navigatorKeys[_currentTab]!.currentState!.maybePop())
          return false;
        else
          return true;
      },
      child: CupertinoHomeScaffold(
        currentTabItem: _currentTab,
        onSelectTab: (item) {
          setState(() {
            _currentTab = item;
          });
        },
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
