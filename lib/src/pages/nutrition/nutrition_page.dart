///
/// Project name : Umenoki
/// Description : Nutrition page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutritionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Nutrition page'),
      )
    );
  }
}