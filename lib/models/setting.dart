import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umenoki/models/auth.dart';

final databaseReference = Firestore.instance;

void saveSetting(List<String> settingData) async {
  await databaseReference.collection("users")
      .document()
      .setData({
        'name': settingData[0],
        'email': settingData[1],
      });

  // DocumentReference ref = await databaseReference.collection("settings")
  //     .add({
  //       'name': 'Flutter in Action',
  //     });
  // print(ref.documentID);
}


void authValidateSubmit() async {
  Auth auth = Auth();
  String userId = "";
  print(auth.currentUser());
  auth.createUser("test@test.com", "testtest");
  if (auth.currentUser() == null) {
    try {
      userId = await auth.signIn("test@test.com", "testtest");
      // print(userId);
      createRecord(userId);
      return;
    }
    catch (e) {
      // print(e);
    }
    if (userId.isEmpty) {
      try {
        userId = await auth.createUser("test@test.com", "testtest");
      } catch (e) {
        // print(e);
      }
    }
    if (userId.isEmpty == false) {
      try {
        userId = await auth.signIn("test@test.com", "testtest");
      } catch (e) {
        // print(e);
      }
      createRecord(userId);
    }
  } else {
    userId = await auth.currentUser();
    // print(userId);
  }
}

void createRecord(String userId) async {
  try {
    await databaseReference.collection("Users")
        .document(userId)
        .setData({
      'name': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });
  } catch (e) {
    print(e);
  }

}





