import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class LoginPage extends StatelessWidget {
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
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.green.shade50),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new TextFormField(
                          onChanged: (value) {},
                          decoration: new InputDecoration(),
                        ),
                        new TextFormField(
                          obscureText: true,
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width:
                                  MediaQuery.of(context).size.width / 2 * 0.7,
                              child: new RaisedButton(
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
                                    dynamic result =
                                        await _authentication.SignInAnon();
                                    if(result != null){
                                      print("Signed In");
                                      print(result.uid);
                                    }else{
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
                        )
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
