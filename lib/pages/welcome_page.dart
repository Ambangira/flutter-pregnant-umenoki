

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Container(
              height: 80.0,
              child: ImageIcon(
                    AssetImage("assets/components/icn_map_health.png"),
                    size: 50.0,
                  ),
            )
          )
        ]
      ),
    );
  }
}