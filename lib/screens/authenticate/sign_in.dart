import 'package:flutter/material.dart';
import 'package:industry_os/screens/services/auth.dart';
import 'package:industry_os/shared/constant.dart';
import 'package:industry_os/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.yellow[600],
            appBar: AppBar(
              title: Text('Industry os'),
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
                            'Login',
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          //email field
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
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
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 60.0),
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
                                setState(() {
                                  loading = true;
                                });
                                dynamic result = await _auth
                                    .signInWithEmailAndPass(email, password);
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
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.black,
                          ),
                          Text(error),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("Don't have an account? Click on register"),
                          // go to register
                          RaisedButton(
                            onPressed: () async {
                              await widget.toggleView();
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.black,
                          )
                        ],
                      ))),
            ),
          );
  }
}
