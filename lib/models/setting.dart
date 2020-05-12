import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = Firestore.instance;

void saveSetting() async {
  await databaseReference.collection("settings")
      .document("1")
      .setData({
        'name': 'Mastering Flutter',
      });

  DocumentReference ref = await databaseReference.collection("settings")
      .add({
        'name': 'Flutter in Action',
      });
  print(ref.documentID);
}