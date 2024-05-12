
import 'package:applanguefront/screens/all_categories.dart';
import 'package:applanguefront/screens/auth/profile_screen.dart';
import 'package:applanguefront/screens/cardScreen.dart';
import 'package:applanguefront/screens/contactus_screen.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../utils/app_constants.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  const MainScreen({super.key, this.selectedIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.selectedIndex);
  }

  @override
  void didUpdateWidget(MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _controller.jumpToTab(widget.selectedIndex);
    }
  }

  List<Widget> _screens() {
    return [

    const   AllCategories(),
      ContactScreen(),
      const CardScreen(),
      const ProfileScreen()



    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CarbonIcons.category,
          color: AppConstants.secondColor,
        ),
        activeColorPrimary: AppConstants.primaryColor,
        inactiveIcon: const Icon(
          CarbonIcons.category,
          color: Colors.white,
        ),
        activeColorSecondary: AppConstants.secondColor,
        title: 'Categories',
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(
          CarbonIcons.edge_service,
          color: AppConstants.secondColor,
        ),
        activeColorPrimary: AppConstants.primaryColor,
        inactiveIcon: const Icon(
          CarbonIcons.phone,
          color: Colors.white,
        ),
        activeColorSecondary: AppConstants.primaryColor,
        title: 'Contact-me',
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),

      PersistentBottomNavBarItem(
          icon: const Icon(
          CarbonIcons.edge_service,
          color: AppConstants.secondColor,
      ),
      activeColorPrimary: AppConstants.primaryColor,
      inactiveIcon: const Icon(
        CarbonIcons.phone_block,
        color: Colors.white,
      ),
        activeColorSecondary: AppConstants.secondColor,
        title: 'my card',
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CarbonIcons.edge_service,
          color: AppConstants.secondColor,
        ),
        activeColorPrimary: AppConstants.primaryColor,
        inactiveIcon: const Icon(
          CarbonIcons.user_admin,
          color: Colors.white,
        ),
        activeColorSecondary: AppConstants.secondColor,
        title: 'profiles',
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        backgroundColor: Colors.white,
        body: PersistentTabView(
          bottomScreenMargin: 0,
          navBarHeight: 80,
          itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 300), curve: Curves.easeIn),
          screenTransitionAnimation: const ScreenTransitionAnimation(
              curve: Curves.ease,
              animateTabTransition: true,
              duration: Duration(milliseconds: 800)),
          context,
          hideNavigationBarWhenKeyboardShows: true,
          confineInSafeArea: true,
          popAllScreensOnTapOfSelectedTab: true,
          margin: const EdgeInsets.only(top: 20, bottom: 20, left: 22, right: 22),
          resizeToAvoidBottomInset: true,
          screens: _screens(),
          items: _navBarsItems(),
          backgroundColor: AppConstants.secondColor,
          controller: _controller,
          padding: const NavBarPadding.symmetric(horizontal: 5, vertical: 15),
          navBarStyle: NavBarStyle.style10,
          decoration: NavBarDecoration(borderRadius: BorderRadius.circular(22)),
          stateManagement: true,
        ),
    );
  }
}
