import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:epos/widgets/roundButton.dart';

class CardImage extends StatelessWidget {
  CardImage({this.topic, this.subTopic, this.price});
  final String topic;
  final String subTopic;
  final String price;
  Container boxContent() {
    return Container(
      height: 124,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border(
          top: BorderSide(width: 2.0, color: Colors.orangeAccent),
          bottom: BorderSide(width: 2.0, color: Colors.orangeAccent),
        ),
        // borderRadius: BorderRadius.only(
        //   bottomRight: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  topic,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 5),
                Text(subTopic),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RoundButton(
                  icon: Icons.add,
                  color: Colors.amberAccent,
                ),
                Text(
                  "£"+price,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container boxImage() {
    return Container(
      child: Image.asset(
        'assets/images/dish2.jpg',
        height: 124,
        width: 124,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          boxImage(),
          Expanded(child: boxContent()),
        ],
      ),
    );
  }
}
