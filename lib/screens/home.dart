import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/constants/task_type.dart';
import 'package:flutter_todo_app/customItems/header_item.dart';
import 'package:flutter_todo_app/customItems/todo_item.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/screens/add_new_task.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lesson",
        description: "Study Comp177",
        isCompleted: false),
    Task(
        type: TaskType.goal,
        title: "Run 5 Km",
        description: "Just Do It!",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false),
  ];
  List<Task> todoCompleted = [
    Task(
        type: TaskType.goal,
        title: "Run 5 Km",
        description: "Just Do It!",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false),
  ];
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
                      return Todoitem(task: todo[index]);
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
                      return Todoitem(task: todoCompleted[index]);
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
