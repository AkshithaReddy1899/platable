import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../views/screens/account_screen.dart';
import '../../views/screens/bookmark_screen.dart';
import '../../views/screens/browser_screen.dart';
import '../../views/screens/home_screen.dart';
import '../app_constants.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _selectedTab = 0;

  final List _pages = const [
    HomeScreen(),
    BrowserScreen(),
    BookmarkScreen(),
    AccountScreen(),
  ];

  _changeTab(int index) {
    if (mounted) {
      setState(() {
        _selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Visibility(
        visible: screenSize.width < 600 ? true : false,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 30,
          backgroundColor: AppConstant.backgroundColor,
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: AppConstant.secondaryColor,
          unselectedItemColor: AppConstant.secondaryTextColor,
          selectedLabelStyle: TextStyle(color: AppConstant.secondaryColor),
          unselectedLabelStyle:
              TextStyle(color: AppConstant.secondaryTextColor),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedIconTheme: IconThemeData(color: AppConstant.secondaryColor),
          unselectedIconTheme:
              IconThemeData(color: AppConstant.secondaryTextColor),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/nav/home.svg'),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/nav/search.svg'),
              label: 'Browser',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/nav/bookmark.svg'),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/nav/user.svg'),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
