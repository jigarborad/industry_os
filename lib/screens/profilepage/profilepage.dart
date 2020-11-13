import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/screens/flyinmenu/flyinmenu.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.yellow[600]),
          child: Drawer1()),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Industry Os'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Hey there, Welcome to the Industry OS ",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
