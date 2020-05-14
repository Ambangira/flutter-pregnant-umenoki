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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final countryController = TextEditingController();
  final ageController = TextEditingController();
  final babyNameController = TextEditingController();
  final curWeekController = TextEditingController();
  final dueDateController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String babyGender = '2';
    String babySkin = '0';
    String givenBirth = '0';
    bool appleWatch = false;
    bool fitbit = false;
    bool notification = false;

    getSetting().then((value){
      nameController.text = value['name'];
      emailController.text = value['email'];
      passController.text = value['password'];
      countryController.text = value['country'];
      ageController.text = value['age'];
      babyNameController.text = value['baby_name'];
      curWeekController.text = value['cur_week'];
      dueDateController.text = value['due_date'];
      heightController.text = value['height'];

    });
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
                nameController.text,
                emailController.text,
                passController.text,
                countryController.text,
                ageController.text,
                babyNameController.text,
                babyGender,
                babySkin,
                curWeekController.text,
                dueDateController.text,
                heightController.text,
                givenBirth,
                appleWatch,
                fitbit,
                notification,
              ];
              authValidateSubmit(settingData);
              final snackBar = SnackBar(
                content: Text('Data is saved successfully'),
                backgroundColor: Colors.green,
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
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
                  controller: nameController,
                ),
                InputField(
                  label: "Your e-mail",
                  controller: emailController,
                ),
                InputField(
                  label: "Password",
                  controller: passController,
                  obscureText: true,
                ),
                InputField(
                  label: "Country",
                  controller: countryController,
                ),
                InputField(
                  label: "Age",
                  controller: ageController,
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
                  controller: babyNameController,
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
                            "0",
                            "1",
                            "2",
                          ],
                          radioButtonValue: (value) {
                            babyGender = value;
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
                            babySkin = value;
                          },
                          selectedColor: AppTheme.nearlyPink,
                        ),
                      ),
                    ],
                  ),
                ),
                InputField(
                  label: "Current week",
                  controller: curWeekController,
                ),
                InputField(
                  label: "Due date",
                  controller: dueDateController,
                ),
                InputField(
                  label: "Height",
                  controller: heightController,
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
                    givenBirth = value;
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
                          appleWatch = value;
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
                          fitbit = value;
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
                          notification = value;
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

