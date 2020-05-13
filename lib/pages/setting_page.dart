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
  final _countryController = TextEditingController();
  final _ageController = TextEditingController();
  final _babyNameController = TextEditingController();
  final _curWeekController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _babyGender = '1';
    String _babySkin = '0';
    String _givenBirth = '0';
    bool _appleWatch = false;
    bool _fitbit = false;
    bool _notification = false;

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
              List settingData = [
                _nameController.text,
                _emailController.text,
                _passController.text,
                _countryController.text,
                _ageController.text,
                _babyNameController.text,
                _babyGender,
                _babySkin,
                _curWeekController.text,
                _dueDateController.text,
                _heightController.text,
                _givenBirth,
                _appleWatch,
                _fitbit,
                _notification,
              ];
              authValidateSubmit(settingData);
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
                  controller: _countryController,
                ),
                InputField(
                  label: "Age",
                  controller: _ageController,
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
                  label: "Baby's name",
                  controller: _babyNameController,
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
                            _babyGender = value;
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
                            _babySkin = value;
                          },
                          selectedColor: AppTheme.nearlyPink,
                        ),
                      ),
                    ],
                  ),
                ),
                InputField(
                  label: "Current week",
                  controller: _curWeekController,
                ),
                InputField(
                  label: "Due date",
                  controller: _dueDateController,
                ),
                InputField(
                  label: "Height",
                  controller: _heightController,
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
                    _givenBirth = value;
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
                          _appleWatch = value;
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
                          _fitbit = value;
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
                          _notification = value;
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

