///
/// Project name : PregSafe
/// Description : settings model
/// Author : Group 3
/// Date : 2022-01
///

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umenoki/src/services/auth.dart';

abstract class BaseSettingModel {
  Future<void> saveSetting(List settingData);
  Future<Map> getSetting();
}

class SettingModel implements BaseSettingModel {
  final databaseReference = FirebaseFirestore.instance;
  
  ///
  /// If the auth is existed, update and if not existed, create
  /// @param String $userId
  /// @param List $settingData
  /// 
  Future<void> saveSetting(List settingData) async {
    User user = await Auth().getCurrentUser();

    try {
      await databaseReference.collection("users")
          .doc(user.uid)
          .set({
        'name':         settingData[0],
        'email':        user.email,
        'password':     settingData[2],
        'country':      settingData[3],
        'age':          settingData[4],
        'baby_name':    settingData[5],
        'baby_gender':  settingData[6],
        'baby_skin':    settingData[7],
        'cur_week':     settingData[8],
        'due_date':     settingData[9],
        'height':       settingData[10],
        'given_birth':  settingData[11],
        'apple_watch':  settingData[12],
        'fitbit':       settingData[13],
        'notification': settingData[14],
      });
    } catch (e) {

    }
  }

  ///
  /// Get function setting data of auth from database
  /// @return Map $data
  /// 
  Future<Map> getSetting() async {
    Map data;

    User user = await Auth().getCurrentUser();
    await databaseReference.collection("users").doc(user.uid).get().then((value) {
      data = value.data as Map;
    });
    if (data == null) {
      data = {
        'name': '',
        'email': user.email,
        'password': '',
        'country': '',
        'age': '',
        'baby_name': '',
        'cur_week': '',
        'due_date': '',
        'height': '',
        'baby_gender': '',
        'baby_skin': '',
        'given_birth': '',
        'apple_watch': false,
        'fitbit': false,
        'notification': false,
      };
    }
    data['email'] = user.email;
    return data;
  }
}

