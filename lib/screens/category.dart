import 'package:flutter/material.dart';
import 'package:epos/widgets/cardImageStackWidget.dart';
import 'package:epos/models/categoryModel.dart';

class Category extends StatelessWidget {
  final List items = [
    CategoryModel(topic: "Starters", subTopic: "Tasty"),
    CategoryModel(topic: "Signature", subTopic: "Tasty"),
    CategoryModel(
        topic: "Curry", subTopic: "Tasty", pathImg: "assets/images/dish3.png"),
    CategoryModel(topic: "Stir fry", subTopic: "Tasty"),
    CategoryModel(
        topic: "Vegatable",
        subTopic: "Tasty",
        pathImg: "assets/images/dish4.png"),
    CategoryModel(
        topic: "Rice&Noodle",
        subTopic: "Tasty",
        pathImg: "assets/images/dish9.png"),
    CategoryModel(
        topic: "Drinking",
        subTopic: "Tasty",
        pathImg: "assets/images/dish8.png"),
    CategoryModel(topic: "Kids Set", subTopic: "Tasty"),
    CategoryModel(topic: "Set Menu", subTopic: "Tasty"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print("CLick");
          },
          child: CardImageStack(
            topic: items[index].topic,
            subTopic: items[index].subTopic,
            image: items[index].pathImg,
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
