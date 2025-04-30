import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/customItems/GestureIconItems.dart';
import 'package:flutter_todo_app/customItems/addNewTaskHeader.dart';
import 'package:flutter_todo_app/customItems/timeDateInputItems.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backGroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddHeaderItem(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Type Task",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Category: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        spacing: 7,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureIconsItem(path: "lib/assets/images/Task.png"),
                          GestureIconsItem(path: "lib/assets/images/Date.png"),
                          GestureIconsItem(path: "lib/assets/images/Trophy.png")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    CustomDateTime(title: "Date"),
                    CustomDateTime(title: "Time"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Notes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 5),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )),
              ElevatedButton(onPressed: () {}, child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
