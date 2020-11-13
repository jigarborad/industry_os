import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:industry_os/model/userdata.dart';
import 'package:provider/provider.dart';

class List1 extends StatefulWidget {
  @override
  _List1State createState() => _List1State();
}

class _List1State extends State<List1> {
  @override
  Widget build(BuildContext context) {
    final userid = Provider.of<UserData>(context);

    String name;
    String employeecode;
    /* setState(() {*/
    name = userid.name;
    employeecode = userid.employeecode;
    //});

    return Container(
      child: Text('$name  $employeecode'),
    );
  }
}
