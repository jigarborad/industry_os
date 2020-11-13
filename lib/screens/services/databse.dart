import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/model/userdata.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection('UserInfo');

  Future updateUserData(String name, String employeecode) async {
    return await userInfo.doc(uid).set({
      'name': name,
      'employeecode': employeecode,
    });
  }

  UserData _userList(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'] ?? '',
        employeecode: snapshot.data()['employeecode'] ?? '');
  }

  Stream<UserData> get userData {
    return userInfo.doc(uid).snapshots().map(_userList);
  }
}
