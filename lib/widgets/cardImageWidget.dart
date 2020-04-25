import 'package:flutter/material.dart';
import 'package:epos/widgets/roundButton.dart';

class CardImage extends StatelessWidget {
  CardImage({this.name, this.price, this.description, this.urlImage,this.cart});

  final String name;
  final String price;
  final String description;
  final String urlImage;
  final Widget cart;

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
                  name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 5),
                Container(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RoundButton(
                  icon: Icons.add,
                  color: Colors.amber,
                  funcCart: cart,
                ),
                Text(
                  "£ " + price,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // child: Image.asset(
  //   'assets/images/dish2.jpg',

  Container boxImage() {
    return Container(
      child: Image.network(
        urlImage,
        height: 124,
        width: 124,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          boxImage(),
          Expanded(child: boxContent()),
        ],
      ),
    );
  }
}
