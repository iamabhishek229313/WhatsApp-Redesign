import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class LoginPage extends StatelessWidget {
  Authentication _authentication  = new Authentication() ;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
    body: Center(
      child: new RaisedButton(
        onPressed: () async {
          dynamic result = await _authentication.SignInAnon();
          if(result == null){
            print("Error signing in");
          }else{
            print("Signed In");
            print(result.uid);
          }
        },
        child: new Text("Sign In" , style: new TextStyle(color: Colors.white),),
        color: Colors.brown,
      ), 
    ),
    );
  }
}
