import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Models/message_model.dart';
import 'package:whatsapp_redesign/Screens/MessagesCards.dart';
import 'package:whatsapp_redesign/Services/Authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Authentication _auth = new Authentication();

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
            print("Camera Clicked ");
          },
          icon: new Icon(
            Icons.camera_alt,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: new Icon(Icons.search),
            iconSize: 30.0,
          ),
          new IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            color: Colors.white,
            iconSize: 30.0,
            icon: new Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return MessagesCard(
              index: index,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.teal.shade900,
        onPressed: () {},
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.teal.shade900,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child: new Row(
            children: <Widget>[
              
            ],
          ),
        ) ,
      ),
    );
  }
}
