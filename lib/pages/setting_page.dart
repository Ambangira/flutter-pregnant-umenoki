///
/// Project name : Umenoki
/// Description :
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umenoki/app_theme.dart';
import 'package:umenoki/main.dart';
import 'package:umenoki/widgets/custom_input.dart';
import 'package:umenoki/widgets/custom_switch.dart';
import 'package:umenoki/widgets/custom_radio.dart';

import 'package:umenoki/models/setting.dart';

class SettingPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: AppTheme.title,),
        centerTitle: true,
        backgroundColor: AppTheme.nearlyRed,
        shape: CustomShapeBorder(),
        // elevation: 5.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => scakey.currentState.onTabTapped(0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Text("Save", style: AppTheme.title,),
            iconSize: 50.0,
            onPressed: (){
              List<String> settingData = [
                _nameController.text,
                _emailController.text,
              ];
              authValidateSubmit();
            },
          ),
        ],
      ),

      body: ListView(
        children: <Widget>[
          Image.asset(
            "assets/components/bg_setting_top1.png",
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),

          // basic information
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage("assets/components/icn_device_info.png"),
                      size: 50.0,
                      color: AppTheme.nearlyDarkRed,
                    ),
                    Text(
                      "Basic Information",
                      style: AppTheme.subTitle,
                    ),
                  ],
                ),
                InputField(
                  label: "Your name",
                  controller: _nameController,
                ),
                InputField(
                  label: "Your e-mail",
                  controller: _emailController,
                ),
                InputField(
                  label: "Password",
                  controller: _passController,
                  obscureText: true,
                ),
                InputField(
                  label: "Country",
                ),
                InputField(
                  label: "Age",
                ),

                // pregnancy information
                new Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage("assets/components/icn_map_health.png"),
                      size: 50.0,
                      color: AppTheme.nearlyDarkRed,
                    ),
                    Text(
                      "Pregnancy Information",
                      style: AppTheme.subTitle,
                    ),
                  ],
                ),
                InputField(
                  label: "Baby's name"
                ),

                Padding(
                  padding: const EdgeInsets.only(top:5, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Baby's gender",
                      ),
                      Spacer(),
                      Container(
                        width: 200.0,
                        padding: const EdgeInsets.only(left: 0),
                        child: CustomRadioButton(
                          enableShape: true,
                          buttonColor: Theme.of(context).canvasColor,
                          status: "wrap",
                          buttonLabels: [
                            "Male",
                            "Female",
                            "          Do not know          ",
                          ],
                          buttonValues: [
                            "1",
                            "2",
                            "0",
                          ],
                          radioButtonValue: (value) {
                            print(value);
                          },
                          selectedColor: AppTheme.nearlyPink,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:5, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Skin colour of\nthe baby's icon",
                      ),
                      Spacer(),
                      Container(
                        width: 200.0,
                        padding: const EdgeInsets.only(left: 0),
                        child: CustomRadioButton(
                          enableShape: true,
                          status: "skin",
                          buttonColor: Theme.of(context).canvasColor,
                          buttonLabels: [
                            "",
                            "",
                            "",
                          ],
                          buttonValues: [
                            "0",
                            "1",
                            "2",
                          ],
                          radioButtonValue: (value) {
                            print(value);
                          },
                          selectedColor: AppTheme.nearlyPink,
                        ),
                      ),
                    ],
                  ),
                ),
                InputField(
                  label: "Current week"
                ),
                InputField(
                  label: "Due date"
                ),
                InputField(
                  label: "Height"
                ),

                Padding(
                  padding: const EdgeInsets.only(top:25.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Have you given birth before?",
                      ),
                    ],
                  ),
                ),
                
                CustomRadioButton(
                  enableShape: true,
                  buttonColor: Theme.of(context).canvasColor,
                  status: "wrap",
                  buttonLabels: [
                    "No",
                    "Yes, I have 1 child",
                    "Yes, I have 2",
                    "Yes, I have 3",
                    "Yes, I have 4+",
                  ],
                  buttonValues: [
                    "0",
                    "1",
                    "2",
                    "3",
                    "4",
                  ],
                  radioButtonValue: (value) {
                    print(value);
                  },
                  selectedColor: AppTheme.nearlyPink,
                ),
                // devices
                new Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage("assets/components/icn_backup_restore.png"),
                      size: 50.0,
                      color: AppTheme.nearlyDarkRed,
                    ),
                    Text(
                      "Devices",
                      style: AppTheme.subTitle,
                    ),
                  ],
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text("Apple Watch"),
                      Spacer(),
                      CustomSwitch(
                        activeColor: AppTheme.nearlyPink,
                        value: false,
                        onChanged: (value) {
                          print("VALUE : $value");
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text("Fitbit"),
                      Spacer(),
                      CustomSwitch(
                        activeColor: AppTheme.nearlyPink,
                        value: false,
                        onChanged: (value) {
                          print("VALUE : $value");
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(35.0),
                        side: BorderSide(color: Colors.red)),
                      onPressed: () {},
                      color: AppTheme.nearlyPink,
                      textColor: Colors.white,
                      child: Text(
                        "Add new device",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text("Notifications"),
                      Spacer(),
                      CustomSwitch(
                        activeColor: AppTheme.nearlyPink,
                        value: false,
                        onChanged: (value) {
                          print("VALUE : $value");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              "assets/components/bg_setting_bottom.png",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}

