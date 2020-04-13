import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  Container boxContent() {
    return Container(
      height: 124,
      padding: EdgeInsets.all(20),
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
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Pad Thai",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                SizedBox(height: 5),
                Text("Testy food in Thailand"),
              ],
            ),
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
