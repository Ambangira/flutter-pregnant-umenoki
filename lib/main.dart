///
/// Project name : Umeniko
/// Description : This Widget is the main application widget.
///               This page defined the basic menu and app bar.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umeniko/app_theme.dart';
import 'package:umeniko/pages/main_baby_page.dart';
import 'package:umeniko/pages/main_health_page.dart';
import 'package:umeniko/pages/main_journey_page.dart';
import 'package:umeniko/pages/main_me_page.dart';
import 'package:umeniko/pages/main_nutrition_page.dart';
import 'package:umeniko/pages/setting_page.dart';

void main() {
  return runApp(MainApp());
}

final scakey = new GlobalKey<_MainWidgetState>();

/// This Widget is the main application widget.
class MainApp extends StatelessWidget {
  static const String _title = 'Umeniko';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: AppTheme.nearlyPink,
        textTheme: AppTheme.textTheme
      ),
      home: MainWidget(key: scakey),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  int _selPage = 0;
  final myKey = new GlobalKey<_MainWidgetState>();

  List<Widget> _widgetOptions = <Widget>[
    BabyPage(),
    MePage(),
    NutritionPage(),
    JourneyPage(),
    HealthPage(),
    SettingPage(),
  ];

  // bottom nav bar items
  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset('assets/components/tabbar_baby.png'),
      activeIcon: Image.asset('assets/components/tabbar_baby_s.png'),
      title: new Text('My Baby'),
      backgroundColor: AppTheme.nearlyPink,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/components/tabbar_me.png'),
      activeIcon: Image.asset('assets/components/tabbar_me_s.png'),
      title: new Text('Me'),
      backgroundColor: AppTheme.nearlyPink,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/components/tabbar_nutrition.png'),
      activeIcon: Image.asset('assets/components/tabbar_nutrition_s.png'),
      title: Text('Nutrition'),
      backgroundColor: AppTheme.nearlyPink,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/components/tabbar_journey.png'),
      activeIcon: Image.asset('assets/components/tabbar_journey_s.png'),
      title: new Text('Journey'),
      backgroundColor: AppTheme.nearlyPink,
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/components/tabbar_health.png'),
      activeIcon: Image.asset('assets/components/tabbar_health_s.png'),
      title: new Text('Health'),
      backgroundColor: AppTheme.nearlyPink,
    ),
  ];

  // tab click event
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selPage = index;
    });
  }

  // setting button click event
  void onSetting(int index) {
    setState(() {
      _selPage = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      body: Center(
        child: _widgetOptions.elementAt(_selPage),
      ),
      
      // bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        backgroundColor: AppTheme.nearlyPink,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppTheme.nearlyDarkRed,
        unselectedFontSize: 14.0,
        items: _items,
      ),
    );
  }
}

// app bar shape
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    
    Path path = Path();
    path.lineTo(0, rect.height - 10);
    path.quadraticBezierTo(
    rect.width / 2, rect.height + 15, rect.width, rect.height - 10);
    path.lineTo(rect.width, 0);

    path.close();
    return path;
  }
}