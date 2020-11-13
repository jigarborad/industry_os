import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/screens/authenticate/authenticate.dart';
import 'package:industry_os/screens/profilepage/profilepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return ProfilePage();
    }
  }
}
