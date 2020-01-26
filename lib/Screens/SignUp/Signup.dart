import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final Authentication _authentication = new Authentication();
  final _formKey = GlobalKey<FormState> () ;

  String _email = '' ;
  String _password = '' ;
  String error = '' ;
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
              Navigator.pop(context);
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
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.teal.shade900,
                          blurRadius: 5.0,
                          offset: new Offset(0.0, 6.0))
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.green.shade50),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Form(
                    key: _formKey,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new TextFormField(
                          validator: (value) => value.isEmpty
                              ? "Enter your Username first"
                              : null,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.person_pin,
                                color: Colors.teal.shade900,
                              ),
                              labelText: "Username",
                              hintText: 'What we call you ? ',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Enter your email first" : null,
                          inputFormatters: <TextInputFormatter>[
                            
                          ],
                          onChanged: (value) {
                            setState(() {
                              _email = value ;
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.alternate_email,
                                color: Colors.teal.shade900,
                              ),
                              labelText: "Email",
                              hintText: 'example@gmail.com',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new TextFormField(
                          validator: (value) => value.length < 10
                              ? "Enter a valid phone number"
                              : null,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                          },
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.call,
                                color: Colors.teal.shade900,
                              ),
                              labelText: "Phone Number",
                              hintText: '+91 XXXX XXXX XX',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new TextFormField(
                          validator: (value) => value.length < 6
                              ? "Password must be of 6 characters"
                              : null,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _password = value ;
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.keyboard,
                                color: Colors.teal.shade900,
                              ),
                              labelText: "Password",
                              hintText: 'First see there is no one around .',
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.teal.shade900))),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width / 2 * 0.7,
                          child: new RaisedButton(
                            color: Colors.teal.shade900,
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                dynamic result = await _authentication.registerWithEmailAndPassword(_email, _password);
                                if(result != null){
                                  Navigator.pop(context);
                                }else{
                                  setState(() {
                                    if(error == '')
                                    error = 'Please supply a valid email' ;
                                    else
                                      error = '' ;
                                  });
                                }
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
                        ),
                        new Text(
                          error,
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.red.shade800,
                          ),
                        ),
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
