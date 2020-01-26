import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Authentication _authentication = new Authentication();

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
              print("Menu Clicked");
            },
            icon: new Icon(
              Icons.arrow_back,
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
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: new BoxDecoration(
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
                            setState(() {});
                          },
                          decoration: new InputDecoration(
                              icon: Icon(Icons.person,color: Colors.teal.shade900,),
                              labelText: "Email",
                              hintText: 'example@gmail.com',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: new InputDecoration(
                              icon: Icon(Icons.keyboard,color: Colors.teal.shade900,),
                              labelText: "Password",
                              hintText: 'example@gmail.com',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width / 2 * 0.7,
                          child: new RaisedButton(
                            color: Colors.teal.shade900,
                            onPressed: () async {
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
                              "Signup",
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}