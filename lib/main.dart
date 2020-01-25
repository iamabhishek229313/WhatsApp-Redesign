import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_redesign/Models/User.dart';
import 'package:whatsapp_redesign/Screens/HomePage.dart';
import 'package:whatsapp_redesign/Screens/Login/LoginPage.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';
import 'package:whatsapp_redesign/Wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamProvider<User>.value(
      value: Authentication().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.white,
            secondaryHeaderColor: Colors.deepOrange,
            cardColor: Colors.blueGrey.shade600,
          ),
          home: Wrapper()),
    );
  }
}
