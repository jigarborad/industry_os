import 'package:flutter/material.dart';
import 'package:industry_os/screens/flyinmenu/flyinmenu.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
        child: Container(),
      ),
    );
  }
}
