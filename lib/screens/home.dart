import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/customItems/headerItem.dart';
import 'package:flutter_todo_app/customItems/todoItem.dart';
import 'package:flutter_todo_app/screens/addNewTask.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todo = ["Test 1", "Test 2", "Test 3"];
  List<String> todoCompleted = ["Code a Game", "Go to School"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backGroundColor),
          body: Column(
            children: [
              //Header
              Headeritem(),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return Todoitem(title: todo[index]);
                    },
                  )),
                ),
              ),
              //Completed Text
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Completed",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                ),
              ),
              //Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todoCompleted.length,
                    itemBuilder: (context, index) {
                      return Todoitem(title: todoCompleted[index]);
                    },
                  )),
                ),
              ),
              //New task button
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(),
                    ));
                  },
                  child: Text("Add New Task")),
            ],
          ),
        ),
      ),
    );
  }
}
