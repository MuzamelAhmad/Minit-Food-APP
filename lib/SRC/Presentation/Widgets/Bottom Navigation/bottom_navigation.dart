import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home Page/home_page.dart';
import 'components/circle_nav_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  ColorScheme get colors => Theme.of(context).colorScheme;
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: PageView(
            controller: pageController,
            onPageChanged: (v) {
              tabIndex = v;
            },
            children: [
              HomePage(),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.lightBlue,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
              ),

              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.green,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
              ),
            ],
          ),

          bottomNavigationBar: CircleNavBar(
            activeIcons: [
              Icon(Icons.home_filled, color: colors.primary),
              Icon(Icons.list_alt, color: colors.primary),
              Icon(Icons.shopping_cart, color: colors.primary),
              Icon(Icons.favorite, color: colors.primary),
              Icon(Icons.person, color: colors.primary),
            ],
            inactiveIcons: [
              Icon(Icons.home_filled, color: colors.secondary),
              Icon(Icons.list_alt, color: colors.secondary),
              Icon(Icons.shopping_cart, color: colors.secondary),
              Icon(Icons.favorite, color: colors.secondary),
              Icon(Icons.person, color: colors.secondary),
            ],
            color: Colors.white,
            circleColor: Colors.white,
            height: 60.0.h,
            circleWidth: 60,
            activeIndex: tabIndex,
            onTap: (index) {
              tabIndex = index;
              pageController.jumpToPage(tabIndex);
            },
            // tabCurve: ,
            // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            shadowColor: colors.surface,
            circleShadowColor: colors.surface,
            elevation: 10,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colors.surface, colors.surface],
            ),
            circleGradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colors.surface, colors.surface],
            ),
          ),
        ),
      ),
    );
  }
}
