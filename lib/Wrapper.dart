import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_redesign/Screens/HomePage.dart';
import 'package:whatsapp_redesign/Screens/Login/LoginPage.dart';

import 'Models/User.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context) ;
    print(user) ;
    if(user == null){
      return LoginPage();
    }else{
      return HomePage();
    }
  }
}