import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:industry_os/apppage/list.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/model/userdata.dart';
import 'package:industry_os/screens/flyinmenu/flyinmenu.dart';
import 'package:industry_os/screens/services/databse.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamProvider<UserData>.value(
        initialData: UserData(),
        value: DatabaseService(uid: user.uid).userData,
        child: Scaffold(
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
            child: Container(child: Column(children: <Widget>[List1()])),
          ),
        ));
  }
}
