import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Models/message_model.dart';

class MessagesCard extends StatelessWidget {
  final index ;
  MessagesCard({@required this.index}) ;
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        // To the the chats 
      },
      child: new Container(
        height: 90.0,
        padding: const EdgeInsets.only(top: 10.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: new BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(35.0),
                    // child: new Container(
                    //   width: 70,
                    //   height: 70,
                    //   color: Colors.deepOrange,
                    // ),
                    child: new Image(
                      width: 70,
                      height: 70,
                      image: AssetImage(chats[index].sender.imageUrl),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 10.0,
                ),
                new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(
                                  chats[index].sender.name,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                new Container(
                                  width: 75.0,
                                  height: 20.0,
                                  margin: const EdgeInsets.only(right: 10.0),
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      color: Colors.greenAccent.shade100),
                                  child: Center(
                                    child: new Text(
                                      chats[index].time,
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            new SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: 250.0,
                              child: new Text(
                                chats[index].text,
                                maxLines: 1,
                                textWidthBasis: TextWidthBasis.longestLine,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              height: 2.0,
              decoration: new BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(2.0)),
            ),
          ],
        ),
      ),
    );
  }
}
