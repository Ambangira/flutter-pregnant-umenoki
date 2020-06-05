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

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class NutritionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: _bodyBuilder(context,)
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

  Widget _bodyBuilder(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 70.0),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,     // tab
              indicator: BubbleTabIndicator(
                indicatorHeight: 50.0,
                indicatorColor: Color(0xFFFFE5E5),
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BubbleTabIndicator(
                      indicatorHeight: 48.0,
                      indicatorColor: Color(0xFFFAC7C7),
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Recommended", style: TextStyle(color: Color(0xFFFE9E6F)),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BubbleTabIndicator(
                      indicatorHeight: 48.0,
                      indicatorColor: Color(0xFFFAC7C7),
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Nutrients", style: TextStyle(color: Color(0xFFFE9E6F)),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Color(0xFFFAC7C7), width: 1.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Symptoms"),
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                  child: Text('This is Recommended')
                ),
                Container(
                  child: Text('This is Nutrients')
                ),
                Container(
                  child: Text('This is Symptoms')
                ),
              ]),
            )
          )
        ],
      ),
    );
  }
}