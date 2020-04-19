import 'package:flutter/material.dart';
import 'package:epos/widgets/cardImageStackWidget.dart';
import 'package:epos/models/categoryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final Firestore _db = Firestore.instance;

  Future<List> _getData() async {
    List items = [];
    try {
      await _db
          .collection('thaivintagewhitchurch')
          .document('category')
          .collection('categorylist')
          .getDocuments()
          .then((payload) {
        payload.documents.forEach((data) {
          items.add(
            CategoryModel(
              topic: data.data['name'].toString(),
              subTopic: data.data['description'].toString(),
            ),
          );
        });
      });
    } catch (err) {
      print(err);
    }
    return items;
  }

  @override
  void initState() {
    super.initState();

    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/listmenu',
                    arguments: <String, String>{
                      'name': snapshot.data[index].topic.toString(),
                    },
                  );
                },
                child: CardImageStack(
                  topic: snapshot.data[index].topic,
                  subTopic: snapshot.data[index].subTopic,
                  image: snapshot.data[index].pathImg,
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        }
      },
    );
  }
}

//   final List items = [
//   CategoryModel(topic: "Starters", subTopic: "Tasty"),
//   CategoryModel(topic: "Signature", subTopic: "Tasty"),
//   CategoryModel(
//       topic: "Curry", subTopic: "Tasty", pathImg: "assets/images/dish3.png"),
//   CategoryModel(topic: "Stir fry", subTopic: "Tasty"),
//   CategoryModel(
//       topic: "Vegatable",
//       subTopic: "Tasty",
//       pathImg: "assets/images/dish4.png"),
//   CategoryModel(
//       topic: "Rice&Noodle",
//       subTopic: "Tasty",
//       pathImg: "assets/images/dish9.png"),
//   CategoryModel(
//       topic: "Drinking",
//       subTopic: "Tasty",
//       pathImg: "assets/images/dish8.png"),
//   CategoryModel(topic: "Kids Set", subTopic: "Tasty"),
//   CategoryModel(topic: "Set Menu", subTopic: "Tasty"),
// ];

// _loading
//         ? CircularProgressIndicator()
//         : ListView.builder(_loading
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/listmenu');
//                 },
//                 child: CardImageStack(
//                   topic: items[index].topic,
//                   subTopic: items[index].subTopic,
//                   image: items[index].pathImg,
//                 ),
//               );
//             },
//             itemCount: items.length,
//           );
