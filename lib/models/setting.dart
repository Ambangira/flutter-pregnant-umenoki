import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

void saveSetting(String name) async {
  await databaseReference.collection("users")
      .document()
      .setData({
        'name': name,
      });

  // DocumentReference ref = await databaseReference.collection("settings")
  //     .add({
  //       'name': 'Flutter in Action',
  //     });
  // print(ref.documentID);
}