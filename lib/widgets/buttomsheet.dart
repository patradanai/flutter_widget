import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:epos/widgets/circleButton.dart';

class BuildButtonSheet extends StatefulWidget {
  BuildButtonSheet({this.title, this.description, this.price});
  final String title;
  final String description;
  final String price;
  @override
  _BuildButtonSheetState createState() => _BuildButtonSheetState();
}

class _BuildButtonSheetState extends State<BuildButtonSheet> {
  int _amount = 1;
  String _remark;
  String _meal;
  TextEditingController _controller = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  widget.title.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepOrange),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Options:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BuildDropdownButton(
                meal: (value) {
                  setState(() {
                    _meal = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Remark:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  controller: _controller,
                  onChanged: (String value) {
                    _remark = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Optional Customer",
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 10, top: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: Theme.of(context).textTheme.title,
                  maxLines: 5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleButton(
                    icon: Icons.remove,
                    color: Colors.amberAccent,
                    funcCart: () {
                      setState(
                        () {
                          if (_amount > 1) {
                            _amount -= 1;
                          }
                        },
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "$_amount",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  CircleButton(
                    icon: Icons.add,
                    color: Colors.amberAccent,
                    funcCart: () {
                      setState(
                        () {
                          _amount += 1;
                        },
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "£" +
                        (double.parse(widget.price) * _amount)
                            .toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  color: Colors.amberAccent,
                  textColor: Colors.black,
                  shape: StadiumBorder(),
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildDropdownButton extends StatefulWidget {
  BuildDropdownButton({this.meal});
  final Function meal;
  @override
  _BuildDropdownButtonState createState() => _BuildDropdownButtonState();
}

class _BuildDropdownButtonState extends State<BuildDropdownButton> {
  String _meal;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem<String>(
          value: 'Pork',
          child: Text("Pork"),
        ),
        DropdownMenuItem<String>(
          value: 'Beef',
          child: Text("Beef (£2.5)"),
        ),
        DropdownMenuItem<String>(
          value: 'Chicken',
          child: Text("Chicken"),
        )
      ],
      value: _meal,
      onChanged: (value) {
        setState(() {
          _meal = value;
        });

        widget.meal(value);
      },
      hint: Text("Option Meal"),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 30, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      style: Theme.of(context).textTheme.title,
    );
  }
}

// class BuildButtonSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: <Widget>[
//             Text("Order"),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Select Options:",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//               ),
//             ),
//             DropdownButton(
//               items: [
//                 DropdownMenuItem(
//                   value: 'Pork',
//                   child: Text("Pork"),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Pork',
//                   child: Text("Pork"),
//                 )
//               ],
//               hint: Text("Option Meal"),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "Total:",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Text(
//                   "302",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 50,
//               width: 200,
//               child: RaisedButton(
//                 color: Colors.amberAccent,
//                 textColor: Colors.black,
//                 shape: StadiumBorder(),
//                 onPressed: () {},
//                 child: Text(
//                   "Add to Cart",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
