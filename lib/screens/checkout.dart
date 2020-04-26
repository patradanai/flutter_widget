import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.menu),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
