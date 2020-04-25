import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:epos/widgets/cardImageWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:epos/models/menulistModel.dart';
import 'package:epos/widgets/buttomsheet.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final Firestore _db = Firestore.instance;
  final FirebaseStorage _loadimg = FirebaseStorage.instance;

  Future<List> _getListMenu() async {
    List _items = [];
    StorageReference ref = _loadimg
        .ref()
        .child('/thaivintagewhitchurch/menulist/starters/prawntempura.jpg');
    String location = await ref.getDownloadURL();

    print(location);

    try {
      await _db
          .collection('thaivintagewhitchurch')
          .document('category')
          .collection('starters')
          .getDocuments()
          .then(
        (data) {
          data.documents.forEach(
            (payload) {
              _items.add(
                MenulistModel(
                    name: payload.data['name'],
                    price: payload.data['price'].toString(),
                    description: payload.data['description'],
                    src: location),
              );
            },
          );
        },
      );
    } catch (err) {
      print(err);
    }
    return _items;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['name'].toString()),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: FutureBuilder(
        future: _getListMenu(),
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
                return CardImage(
                    name: snapshot.data[index].name,
                    price: snapshot.data[index].price,
                    description: snapshot.data[index].description,
                    urlImage: snapshot.data[index].src,
                    cart: BuildButtonSheet(
                      title: snapshot.data[index].name,
                      description: snapshot.data[index].description,
                      price: snapshot.data[index].price,
                    ));
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_basket),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
