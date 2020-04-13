import 'package:flutter/material.dart';

class CardImageStack extends StatelessWidget {
  CardImageStack({this.topic, this.subTopic, this.image});
  final String topic;
  final String subTopic;
  final Image image;

  Container textCentent() {
    return Container(
      margin: EdgeInsets.fromLTRB(
        76.0,
        16.0,
        16.0,
        16.0,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            topic,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subTopic,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Container cardContainer() {
    return Container(
      child: textCentent(),
      height: 124,
      margin: EdgeInsets.only(left: 46),
      decoration: BoxDecoration(
          color: Color(0xFFC0F17C),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(0, 10),
            )
          ]),
    );
  }

  Container cardImage() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      alignment: Alignment.topLeft,
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Stack(
        children: <Widget>[cardContainer(), cardImage()],
      ),
    );
  }
}
