import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Screens/SignUp/Signup.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Authentication _authentication = new Authentication();

  String email = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new AppBar(
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          title: new Text(
            "WhatsApp",
            style: new TextStyle(
              fontFamily: 'Nunito-Regular',
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          leading: new IconButton(
            onPressed: () {
              print("Menu Clicked ");
            },
            icon: new Icon(
              Icons.menu,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            new Center(
              child: new Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: new BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.teal.shade900,
                        offset: new Offset(0.0, 5.0),
                        blurRadius: 5.0
                      )
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.green.shade50),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value ; 
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Icon(Icons.alternate_email,color: Colors.teal.shade900,),
                              labelText: "Email",
                              hintText: 'example@gmail.com',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value ;
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Icon(Icons.keyboard,color: Colors.teal.shade900,),
                              labelText: "Password",
                              hintText: 'First see there is no one around .',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 * 0.7,
                              child: new RaisedButton(
                                onPressed: () => exit(0),
                                color: Colors.red,
                                child: new Text(
                                  "Dismiss",
                                  style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 * 0.7,
                              child: new RaisedButton(
                                color: Colors.teal.shade900,
                                onPressed: () async {
                                  print(email);
                                  print(password);
                                  dynamic result =
                                      await _authentication.SignInAnon();
                                  if (result != null) {
                                    print("Signed In");
                                    print(result.uid);
                                  } else {
                                    print("Error Signing in");
                                  }
                                },
                                child: new Text(
                                  "Log in",
                                  style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text("Not having an account ?",
                                style: new TextStyle(
                                    color: Colors.blueGrey.shade600,
                                    fontSize: 15.0)),
                            new InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),);
                              },
                              child: new Text("Let's make it.",
                                style: new TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.teal.shade900,
                                  fontSize: 15.0
                                )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            new Positioned(
              bottom: 5.0,
              left: MediaQuery.of(context).size.width * 0.05,
              child: new Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(5.0)),
                child: new Align(
                    alignment: Alignment.center,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Text(
                          "Made with ❤ by Abhishek",
                          style: new TextStyle(
                              fontSize: 13.0, color: Colors.blueGrey.shade600),
                        ),
                        new Text(
                          "github.com/iamabhishek229313",
                          style: new TextStyle(
                              fontSize: 13.0, color: Colors.blueGrey.shade600),
                        ),
                        new Text(
                          "Thanks for being there . ",
                          style: new TextStyle(
                              fontSize: 13.0, color: Colors.blueGrey.shade600),
                        )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
