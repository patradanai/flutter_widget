import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.topic, this.subTopic, this.icons, this.colorBg});
  final String topic;
  final String subTopic;
  final IconData icons;
  final Color colorBg;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              icons,
              color: Colors.white,
            ),
            radius: 26,
            backgroundColor: colorBg,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            topic,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subTopic,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 10.0),
              blurRadius: 10,
            ),
          ]),
    );
  }
}
