import 'package:flutter/material.dart';
import 'package:epos/widgets/cardWidget.dart';
import 'package:epos/widgets/cardImageStackWidget.dart';
import 'package:epos/widgets/cardImageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CardWidget(
                    topic: "Manage",
                    subTopic: "Edit, Share, Delete",
                    colorBg: Colors.black,
                    icons: Icons.edit,
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    topic: "Tasks",
                    subTopic: "Personal Task",
                    colorBg: Colors.blueAccent,
                    icons: Icons.calendar_today,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardImageStack(
              topic: "Starter Menus",
              subTopic: "Fast food",
              image: Image.asset(
                'assets/images/dish1.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
          Expanded(
            child: CardImage(),
          ),
        ],
      ),
    );
  }
}
