import 'package:flutter/material.dart';
import 'package:industry_os/screens/services/auth.dart';
import 'package:industry_os/shared/constant.dart';
import 'package:industry_os/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String name = '';
  String employeecode = '0';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.yellow[600],
              appBar: AppBar(
                title: Text('Industr OS'),
                centerTitle: true,
                backgroundColor: Colors.black,
                elevation: 5.0,
              ),
              body: SingleChildScrollView(
                child: Container(
                    child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            Text(
                              'Register',
                              style: TextStyle(
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0),
                            ),
                            SizedBox(height: 30.0),
                            //name field
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 60.0, right: 60.0),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Name'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please Enter Name' : null,
                                onChanged: (val) {
                                  setState(() {
                                    name = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            //employee code field
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 60.0, right: 60.0),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Employee Code'),
                                validator: (val) => val.isEmpty
                                    ? 'Please enter your valid employee code'
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    employeecode = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),

                            //email field
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 60.0, right: 60.0),
                              child: TextFormField(
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Please Enter Email' : null,
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            //password field
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 60.0, right: 60.0),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'password'),
                                validator: (val) => val.length < 6
                                    ? 'Enter valid pass 6 + char'
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              onPressed: () async {
                                if (_formkey.currentState.validate()) {
                                  loading = true;
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password, name, employeecode);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'Please enter valid email and password';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.black,
                            ),

                            Text(error),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('Already Have an account? Click on Login'),
                            // go to sign in
                            RaisedButton(
                              onPressed: () async {
                                await widget.toggleView();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.black,
                            ),
                          ],
                        ))),
              ),
            ),
          );
  }
}
