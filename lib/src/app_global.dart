///
/// Project name : Umenoki
/// Description : Global static
/// Author : Xiao
/// Date : 2020-06-03
///

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/pages/auth/auth_login_page.dart';
import 'package:umenoki/src/pages/auth/auth_register_page.dart';
import 'package:umenoki/src/pages/mybaby/mybaby_page.dart';
import 'package:umenoki/src/pages/mybaby/mybaby_setting_page.dart';
import 'package:umenoki/src/pages/me_page.dart';
import 'package:umenoki/src/pages/nutrition/nutrition_tab_page.dart';
import 'package:umenoki/src/pages/nutrition/nutrition_subject.dart';
import 'package:umenoki/src/pages/nutrition/nutrition_subject_detail.dart';
import 'package:umenoki/src/pages/nutrition/nutrition_subject_recipe.dart';
import 'package:umenoki/src/pages/journey_page.dart';
import 'package:umenoki/src/pages/health_page.dart';

class AppGlobal {
  static String appTitle = 'PregSafe';

  // Bottom navigation bar items
  static List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon:   Image.asset('assets/components/immunization2.png'),

      label:  ('Immunize'),
      backgroundColor: AppTheme.nearlyblue,

    ),
    BottomNavigationBarItem(
      icon:             Image.asset('assets/components/tabbar_me.png'),
      activeIcon:       Image.asset('assets/components/tabbar_me_s.png'),
      label:            ('Me'),
      backgroundColor:  AppTheme.nearlyblue,
    ),
    BottomNavigationBarItem(
      icon:             Image.asset('assets/components/tabbar_nutrition.png'),
      activeIcon:       Image.asset('assets/components/tabbar_nutrition_s.png'),
      label:            ('Nutrition'),
      backgroundColor:  AppTheme.nearlyblue,
    ),
    BottomNavigationBarItem(
      icon:             Image.asset('assets/components/tabbar_journey.png'),
      activeIcon:       Image.asset('assets/components/tabbar_journey_s.png'),
      label:            ('Journey'),
      backgroundColor:  AppTheme.nearlyblue,
    ),
    BottomNavigationBarItem(
      icon:             Image.asset('assets/components/tabbar_health.png'),
      activeIcon:       Image.asset('assets/components/tabbar_health_s.png'),
      label:            ('Health'),
      backgroundColor:  AppTheme.nearlyblue,
    ),
  ];

  // page widgets
  static Map<String, Widget> widgetOptions = {
    'auth/login':             LoginPage(),
    'auth/register':          RegisterPage(),
    'mybaby':                 MyBabyPage(),
    'mybaby/setting':         MyBabySettingPage(),
    'me':                     MePage(),
    'nutrition':              NutritionPage(),
    'nutrition/subject':      NutritionSubjectPage(),
    'nutrition/subject/detail': NutritionSubjectDetailPage(),
    'nutrition/subject/recipe': NutritionSubjectRecipePage(),
    'journey':                JourneyPage(),
    'health':                 HealthPage(),
  };
}