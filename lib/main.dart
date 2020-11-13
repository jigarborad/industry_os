import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/screens/services/auth.dart';
import 'package:industry_os/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: FirebaseAuth.instance.authStateChanges(),
      child: MaterialApp(home: Wrapper()),
    );
  }
}
