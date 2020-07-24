import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:profe_case_study/ui/check/check_page.dart';
import 'package:profe_case_study/ui/flight/flight_page.dart';
import 'package:profe_case_study/ui/master/master_page.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> with SingleTickerProviderStateMixin {
  int pageIndex = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
    );
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.blue,
        activeIconColor: Colors.blue,
        circleColor: Colors.white,
        inactiveIconColor: Colors.white,
        initialSelection: 1,
        textColor: Colors.white,
        tabs: [
          TabData(
            iconData: Icons.flight,
            title: "Flight",
          ),
          TabData(
            iconData: Icons.compare_arrows,
            title: "Görev Atama",
          ),
          TabData(
            iconData: Icons.check,
            title: "Check",
          ),
        ],
        onTabChangedListener: (position) {
          onTap(position);
        },
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged(pageIndex),
          physics: NeverScrollableScrollPhysics(),
          children: [
            FlightPage(),
            MasterPage(),
            CheckPage(),
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
