///
/// Project name : Umenoki
/// Description : This Widget is the main application widget.
///               This page defined the basic menu and app bar.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/models/push_notifications.dart';
import 'package:umenoki/src/models/auth.dart';
import 'package:umenoki/src/app_global.dart';

void main() {
  return runApp(MainApp());
}

final scakey = new GlobalKey<_MainWidgetState>();

/// This Widget is the main application widget.
class MainApp extends StatelessWidget {
  static const String _title = 'Umenoki';
  
  @override
  Widget build(BuildContext context) {
    PushNotificationsManager().init();
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
  int _selIndex    = 0;
  String _selPage       = 'my_baby';
  
  final myKey           = new GlobalKey<_MainWidgetState>();

  final Map<String, Widget> _widgetOptions = AppGlobal.widgetOptions;

  // bottom nav bar items
  final List<BottomNavigationBarItem> _items = AppGlobal.navItems;

  // tab click event
  void onTabTapped(int index) {
    setState(() {
      _selIndex = index;
      switch (index) {
        case 0:
          _selPage = 'my_baby';
          break;
        case 1:
          _selPage = 'me';
          break;
        case 2:
          _selPage = 'nutrition';
          break;
        case 3:
          _selPage = 'journey';
          break;
        case 4:
          _selPage = 'health';
          break;
      }
    });
  }

  // setting button click event
  void onSetting(String selPage, int index) {
    setState(() {
      _selPage = selPage;
      _selIndex = index;
    });
  }

  void initState() {
    super.initState();
    Auth().currentUser().then((value){
      if (value == null) {
        _selPage = 'sign';
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (_selPage == 'sign' || _selPage == 'register') {               // already sign
      return Scaffold(
        key: myKey,
        body: Center(
          child: _widgetOptions[_selPage],
        ),
      );
    } else {                                                          // not sign
      return Scaffold(
        key: myKey,
        body: Center(
          child: _widgetOptions[_selPage],
        ),

        // bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _selIndex,
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
}