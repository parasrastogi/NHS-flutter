import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newhomesource/view/screens/tab_items.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../cupertino_home_scaffold.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  bool isHidden = false;
  TabItems _currentTab = TabItems.search;
  late PersistentTabController _controller;

  final Map<TabItems, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItems.saved: GlobalKey<NavigatorState>(),
    TabItems.notes: GlobalKey<NavigatorState>(),
    TabItems.search: GlobalKey<NavigatorState>(),
    TabItems.photos: GlobalKey<NavigatorState>(),
    TabItems.more: GlobalKey<NavigatorState>(),
  };

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

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

      ////////////
      // child: Scaffold(
      //   // appBar: AppBar(
      //   //   automaticallyImplyLeading: false, // hide back button
      //   //
      //   //   title: SizedBox(
      //   //     child: Image.asset(
      //   //       'images/logo.png',
      //   //       width: 150,
      //   //     ),
      //   //   ),
      //   // ),
      //   body: PersistentTabView(
      //     context,
      //     controller: _controller,
      //     screens: _buildScreens(),
      //     items: _navBarsItems(),
      //     confineInSafeArea: true,
      //     backgroundColor: Colors.white, // Default is Colors.white.
      //     handleAndroidBackButtonPress: true, // Default is true.
      //     resizeToAvoidBottomInset:
      //         true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //     stateManagement: true, // Default is true.
      //     hideNavigationBarWhenKeyboardShows:
      //         true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      //     decoration: NavBarDecoration(
      //       borderRadius: BorderRadius.circular(10.0),
      //       colorBehindNavBar: Colors.white,
      //     ),
      //     popAllScreensOnTapOfSelectedTab: true,
      //     popActionScreens: PopActionScreensType.all,
      //     itemAnimationProperties: ItemAnimationProperties(
      //       // Navigation Bar's items animation properties.
      //       duration: Duration(milliseconds: 200),
      //       curve: Curves.ease,
      //     ),
      //     screenTransitionAnimation: ScreenTransitionAnimation(
      //       // Screen transition animation on change of selected tab.
      //       animateTabTransition: true,
      //       curve: Curves.ease,
      //       duration: Duration(milliseconds: 200),
      //     ),
      //     navBarStyle: NavBarStyle
      //         .style1, // Choose the nav bar style with this property.
      //   ),);
    );
  }

  // List<Widget> _buildScreens() {
  //   return [NotesPage(), SavePage(), SearchPage(), PhotosPage(), MorePage()];
  // }
  //
  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Saved"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.settings),
  //       title: ("Notes"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.search),
  //       title: ("Search"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.photo_fill),
  //       title: ("Photos"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.table_badge_more),
  //       title: ("More"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }
}
