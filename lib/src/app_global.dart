
import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/pages/main_baby_page.dart';
import 'package:umenoki/src/pages/main_health_page.dart';
import 'package:umenoki/src/pages/main_journey_page.dart';
import 'package:umenoki/src/pages/main_me_page.dart';
import 'package:umenoki/src/pages/main_nutrition_page.dart';
import 'package:umenoki/src/pages/setting_page.dart';
import 'package:umenoki/src/pages/sign_page.dart';


class AppGlobal {
  // Bottom navigation bar items
  List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
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

  // page widgets
  Map<String, Widget> widgetOptions = {
    'my_baby':          BabyPage(),
    'me':               MePage(),
    'sign':             SignPage(),
    'nutrition':        NutritionPage(),
    'journey':          JourneyPage(),
    'health':           HealthPage(),
    'my_baby_setting':  SettingPage(),
  };
}