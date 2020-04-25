import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({this.icon, this.color, this.funcCart});
  final Color color;
  final IconData icon;
  final Function funcCart;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size(36, 36)),
      child: Icon(
        icon,
        size: 20,
      ),
      shape: CircleBorder(),
      elevation: 5,
      fillColor: color,
      onPressed: funcCart,
    );
  }
}
