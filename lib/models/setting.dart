///
/// Project name : Umenoki
/// Description : settings model
/// Author : Xiao
/// Date : 2020-05-14
///

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umenoki/models/auth.dart';

abstract class BaseSetting {

  Future<void> authValidateSubmit(List settingData);
  Future<void> saveSetting(String userId, List settingData);
  Future<Map> getSetting();
}

class Setting implements BaseSetting {
  final databaseReference = Firestore.instance;
  
  Future<void> authValidateSubmit(List settingData) async {
    String userId = "";

    if (await Auth().currentUser() == null) {
      try {
        userId = await Auth().signIn(settingData[1], settingData[2]);
        saveSetting(userId, settingData);
        return;
      }
      catch (e) {
        userId = await Auth().createUser(settingData[1], settingData[2]);
        saveSetting(userId, settingData);
      }
    } else {
      userId = await Auth().currentUser();
      saveSetting(userId, settingData);
    }
  }

  Future<void> saveSetting(String userId, List settingData) async {
    try {
      await databaseReference.collection("users")
          .document(userId)
          .setData({
        'name':         settingData[0],
        'email':        settingData[1],
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

  Future<Map> getSetting() async {
    Map data;
    String userId = "";

    if (await Auth().currentUser() == null) {
      // userId = await auth.signIn(settingData[1], settingData[2]);
    }else{
      userId = await Auth().currentUser();
      await databaseReference.collection("users").document(userId).get().then((value) {
        data = value.data;
      });
    }
    return data;
  }
}

