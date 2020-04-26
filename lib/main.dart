import 'package:flutter/material.dart';
import 'package:epos/screens/category.dart';
import 'package:epos/screens/menulist.dart';
import 'package:epos/screens/checkout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Colors.blueAccent),
      home: MainScreen(),
      // initialRoute: '/category',
      routes: {
        '/category': (context) => MainScreen(),
        '/listmenu': (context) => MenuList(),
        '/checkout': (context) => CheckOut()
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EPOS"),
      ),
      body: Category(),
    );
  }
}

//Column(
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
//Expanded(
//child: Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Expanded(
//child: CardWidget(
//topic: "Manage",
//subTopic: "Edit, Share, Delete",
//colorBg: Colors.black,
//icons: Icons.edit,
//),
//),
//Expanded(
//child: CardWidget(
//topic: "Tasks",
//subTopic: "Personal Task",
//colorBg: Colors.blueAccent,
//icons: Icons.calendar_today,
//),
//),
//],
//),
//),
//Expanded(
//child: CardImageStack(
//topic: "Starter Menus",
//subTopic: "Fast food",
//image: Image.asset(
//'assets/images/dish1.png',
//width: 120,
//height: 120,
//),
//),
//),
//Expanded(
//child: CardImage(topic:"Pad Thai",subTopic: "Famous in Thailand",price: "20",),
//),
//],
//),
