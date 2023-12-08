import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping_app/Features/Favorits/presentation/views/favorits_view.dart';
import 'package:online_shopping_app/Features/Home/presentation/views/home_view.dart';
import 'package:online_shopping_app/Features/Profile/presentation/views/profile_view.dart';
import 'package:online_shopping_app/Features/Search/presentation/views/search_view.dart';
import 'package:online_shopping_app/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static const routeName = 'CustomBottomNavigationBar';
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  PersistentTabController? _controller;

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const SearchView(),
      const FavoritsView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.house, size: 20),
        title: "Home",
        activeColorPrimary: Constants.whiteColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
        title: "Search",
        activeColorPrimary: Constants.whiteColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.solidHeart, size: 20),
        title: "Favorits",
        activeColorPrimary: Constants.whiteColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.solidUser, size: 20),
        title: "Profile",
        activeColorPrimary: Constants.whiteColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      padding: const NavBarPadding.all(0),
      navBarHeight: 60,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Constants.primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        colorBehindNavBar: Colors.transparent,
        boxShadow: CupertinoContextMenu.kEndBoxShadow,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
