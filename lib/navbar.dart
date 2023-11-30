import 'package:ecommerce_app/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PersistentNavbarEg extends StatefulWidget {
  const PersistentNavbarEg({super.key});

  @override
  State<PersistentNavbarEg> createState() => _PersistentNavbarEgState();
}

class _PersistentNavbarEgState extends State<PersistentNavbarEg> {
  //Declaring Controller for bottom nav bar
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //List of Screens to show
  List<Widget> _buildScreens() {
    return [const Onlinepg(), Container(), Container()];
  }

  //List of PersistentBottomNavBarItem (theicons in bottom nav bar)
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        //title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        //title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        //title: ("User"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  // Here we start a build context
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, //this needs to be true if u want to move up the screen whn keyb appears

      hideNavigationBarWhenKeyboardShows:
          true, // recommended to set 'resizeToavoidbottomInset' as true while this argument

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      itemAnimationProperties: const ItemAnimationProperties(
        //Navigations bars items animation properties
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),

      screenTransitionAnimation: const ScreenTransitionAnimation(
        //screen transition animation on change of selected tab
        animateTabTransition: true,
        curve: Curves.easeInOutQuart,
        duration: Duration(microseconds: 400),
      ),

      navBarStyle: NavBarStyle.style14,
    );
  }
}
