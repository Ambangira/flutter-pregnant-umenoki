///
/// Project name : Umenoki
/// Description :
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umenoki/main.dart';
import 'package:umenoki/src/models/auth.dart';

/// This Widget is the main application widget.
class MePage extends StatelessWidget {
  static const String _title = 'Umenoki';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: Colors.blue,
          child: Text('Log Out',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            )
          ),
          onPressed: () {
            Auth().signOut().then((value){
              scakey.currentState.onSetting('sign', 0);
            });
          },
        ),
    );
  }
}
