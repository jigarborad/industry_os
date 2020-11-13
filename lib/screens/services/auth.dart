import 'package:firebase_auth/firebase_auth.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/screens/services/databse.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _userFroFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //stream
  Stream<User> get user {
    return user != null ? _auth.authStateChanges() : null;
  }

  String email;
  String password;
  // sign in with email and pass
  Future signInWithEmailAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user != null ? _userFroFirebaseUser(user) : null;
    } catch (e) {}
  }

  //register with email and pass
  Future registerWithEmailAndPassword(
      String email, String password, String name, String employeecode) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(name, employeecode);
      return user != null ? _userFroFirebaseUser(user) : null;
    } catch (e) {}
  }
  //sign in with gmail
  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
