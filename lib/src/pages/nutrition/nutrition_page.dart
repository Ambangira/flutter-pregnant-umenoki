///
/// Project name : Umenoki
/// Description : Nutrition page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';

class NutritionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: _bodyBuilder(context),
    );
  }

  Widget _appBarBuilder(BuildContext context) {
    return AppBar(
      title: Text("Nutrition", style: AppTheme.title,),
      centerTitle: true,
      backgroundColor: AppTheme.nearlyRed,
      shape: CustomShapeBorder(),
      // elevation: 5.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/components/nutrition/icn_plus.png"),
            size: 50.0,
            color: Colors.white,
          ),
          iconSize: 50.0,
          onPressed: (){

          },
        ),
      ],
    );
  }

  Widget _bodyBuilder(BuildContext context) {
    return Text('data');
  }
}