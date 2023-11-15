import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_signup/src/views/auth/models/user_model.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference qariCollection =
      FirebaseFirestore.instance.collection('Qaries');

  // saving the userdata
  Future savingUserData(UserModel user) async {
    return await userCollection
        .doc(uid)
        .set(user.toJson())
        .catchError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  Future savingQariesData(UserModel user) async {
    return await qariCollection
        .doc(uid)
        .set(user.toJson())
        .catchError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  // getting user data
  Future gettingUserDataWithEmail(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<DocumentSnapshot> getUserData() async {
    final DocumentReference document = userCollection.doc(uid);
    return await document.get();
  }

  Future<DocumentSnapshot> getQariesData() async {
    final DocumentReference document = qariCollection.doc(uid);
    return await document.get();
  }

  Future<void> updataUserData(UserModel userModel) async {
    await userCollection.doc(uid).update(userModel.toJson());
  }

  Future<void> updataQariesData(UserModel userModel) async {
    await qariCollection.doc(uid).update(userModel.toJson());
  }
}
