/// 
/// Project name: Umenoki
/// Description: Nutrition subject page
/// Author: Xiao
/// Date: 2020-06-10
/// 

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';

class NutritionSubjectPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionSubjectPageState();
}

class _NutritionSubjectPageState extends State<NutritionSubjectPage>{
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: _appBarWidget(context, arguments['title']),
      body: _bodyWidget(context)
    );
  }

  Widget _appBarWidget(BuildContext context, String title) {
    return AppBar(
      title: Text(title, style: AppTheme.title,),
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
          Navigator.pushReplacementNamed(context, '/nutrition');
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/components/nutrition/icn_plus.png"),
            size: AppTheme.iconSize,
            color: Colors.white,
          ),
          iconSize: AppTheme.iconSize,
          onPressed: (){

          },
        ),
      ],
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Center(
      
    );
  }
}