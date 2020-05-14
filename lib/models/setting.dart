import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umenoki/models/auth.dart';

final databaseReference = Firestore.instance;

void authValidateSubmit(List settingData) async {
  Auth auth = Auth();
  String userId = "";

  if (await auth.currentUser() == null) {
    try {
      userId = await auth.signIn(settingData[1], settingData[2]);
      saveSetting(userId, settingData);
      return;
    }
    catch (e) {
      userId = await auth.createUser(settingData[1], settingData[2]);
      saveSetting(userId, settingData);
    }
  } else {
    userId = await auth.currentUser();
    saveSetting(userId, settingData);
  }
}

void saveSetting(String userId, List settingData) async {
  try {
    await databaseReference.collection("users")
        .document(userId)
        .setData({
      'name': settingData[0],
      'email': settingData[1],
      'password': settingData[2],
      'country': settingData[3],
      'age': settingData[4],
      'baby_name': settingData[5],
      'baby_gender': settingData[6],
      'baby_skin': settingData[7],
      'cur_week': settingData[8],
      'due_date': settingData[9],
      'height': settingData[10],
      'given_birth': settingData[11],
      'apple_watch': settingData[12],
      'fitbit': settingData[13],
      'notification': settingData[14],
    });
  } catch (e) {

  }
}

Future<Map> getSetting() async {
  Map data;
  Auth auth = Auth();
  String userId = "";

  if (await auth.currentUser() == null) {
    // userId = await auth.signIn(settingData[1], settingData[2]);
  }else{
    userId = await auth.currentUser();
    await databaseReference.collection("users").document(userId).get().then((value) {
      data = value.data;
    });
  }
  return data;
}



