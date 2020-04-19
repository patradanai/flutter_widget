import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.icon,this.color});
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size(45,45)),
      child:Icon(icon,size: 25,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      fillColor: color,
      onPressed: (){},
    );
  }
}
