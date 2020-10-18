import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("userdata");

  DatabaseService({this.uid});

  Future updateUserData(String name, String email) async {
    return await brewCollection.doc(uid).set({
      "name": name,
      "email": email,
    });
  }
}
