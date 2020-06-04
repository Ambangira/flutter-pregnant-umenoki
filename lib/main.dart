import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/pages/home_page.dart';
import 'package:umenoki/src/app_global.dart';
import 'package:umenoki/src/pages/auth/auth_login_page.dart';
import 'package:umenoki/src/pages/auth/auth_register_page.dart';
import 'package:umenoki/src/services/auth.dart';
import 'package:umenoki/src/services/push_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PushNotificationsManager().init();

    return MaterialApp(
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/register': (BuildContext context) => new RegisterPage(),
        '/mybaby': (BuildContext context) => new HomePage(selPage: 'mybaby', selIndex: 0,),
        '/mybaby/setting': (BuildContext context) => new HomePage(selPage: 'mybaby_setting', selIndex: 0,),
        '/me': (BuildContext context) => new HomePage(selPage: 'me', selIndex: 1,),
        '/nutrition': (BuildContext context) => new HomePage(selPage: 'nutrition', selIndex: 2,),
        '/journey': (BuildContext context) => new HomePage(selPage: 'journey', selIndex: 3,),
        '/health': (BuildContext context) => new HomePage(selPage: 'health', selIndex: 4,),
      },
      title: AppGlobal.appTitle,
      theme: ThemeData(
        primaryColor: AppTheme.nearlyPink,
        textTheme: AppTheme.textTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<FirebaseUser>(
        future: Auth().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return HomePage(selPage: 'mybaby', selIndex: 0,);
          }
          return LoginPage();
        }
      ),
    );
  }
}
