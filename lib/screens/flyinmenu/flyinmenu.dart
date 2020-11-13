import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:industry_os/apppage/dailylogs.dart';
import 'package:industry_os/apppage/home.dart';
import 'package:industry_os/apppage/internalauditreport.dart';
import 'package:industry_os/apppage/report.dart';
import 'package:industry_os/apppage/safetymeetingloggers.dart';
import 'package:industry_os/model/user.dart';
import 'package:industry_os/screens/services/auth.dart';
import 'package:provider/provider.dart';

class Drawer1 extends StatefulWidget {
  @override
  _Drawer1State createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              'Drawer header',
              style: TextStyle(color: Colors.white),
            ),
          ),
          CustomTile(
            icon: Icons.home,
            tilename: 'home',
            onTap: () {
              Navigator.pop(context, Drawer1());
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          CustomTile(
              icon: Icons.report,
              tilename: 'Report',
              onTap: () {
                Navigator.pop(context, Drawer1());
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Report()));
              }),
          CustomTile(
              icon: Icons.pages,
              tilename: 'Daily Logs',
              onTap: () {
                Navigator.pop(context, Drawer1());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DailyLogs()));
              }),
          CustomTile(
              icon: Icons.edit,
              tilename: 'Safety meeting Logeers',
              onTap: () {
                Navigator.pop(context, Drawer1());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SafetyMettingLoggers()));
              }),
          CustomTile(
              icon: Icons.security,
              tilename: 'Internal Audit Report',
              onTap: () {
                Navigator.pop(context, Drawer1());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InternalAuditReport()));
              }),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FlatButton(
                color: Colors.black,
                child: Text(
                  'SignOut',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await Provider.of(context)._auth.signOut();
                }),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String tilename;
  final Function onTap;
  CustomTile({this.icon, this.tilename, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white)),
          color: Colors.yellow[600]),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(tilename),
        onTap: onTap,
      ),
    );
  }
}
