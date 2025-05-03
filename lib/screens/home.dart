import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/customItems/custom_button.dart';
import 'package:flutter_todo_app/customItems/header_item.dart';
import 'package:flutter_todo_app/customItems/todo_item.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/screens/add_new_task.dart';
import 'package:flutter_todo_app/services/auth.dart';
import 'package:flutter_todo_app/services/firestore.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Auth firebaseAuth = Auth();
    double deviceWidth = MediaQuery.of(context).size.width;
    FirestoreService fire = FirestoreService();

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backGroundColor),
          body: Column(
            children: [
              //Header
              Headeritem(onTap: () {
                firebaseAuth.userLogout();
              }),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: fire.getUserUnCompletedTodos(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            final todos = snapshot.data!.docs;

                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: todos.length,
                              itemBuilder: (context, index) {
                                final todo = todos[index];
                                Task task = Task(
                                    description: todo["description"],
                                    isCompleted: false,
                                    title: todo["title"],
                                    type: todo["iconType"]);
                                return Todoitem(
                                  docId: todo.id,
                                  task: task,
                                  completed: todo["completed"],
                                );
                              },
                            );
                          })),
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
                      child: StreamBuilder<QuerySnapshot>(
                          stream: fire.getUserCompletedTodos(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            final completedTodos = snapshot.data!.docs;
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: completedTodos.length,
                              itemBuilder: (context, index) {
                                final completedTodo = completedTodos[index];
                                Task completedTask = Task(
                                    description: completedTodo["description"],
                                    isCompleted: false,
                                    title: completedTodo["title"],
                                    type: completedTodo["iconType"]);
                                return Todoitem(
                                  docId: completedTodo.id,
                                  task: completedTask,
                                  completed: completedTodo["completed"],
                                );
                              },
                            );
                          })),
                ),
              ),
              //New task button
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CustomButtonItem(
                    width: deviceWidth - 40,
                    height: 40,
                    text: "Add New Todo",
                    color: Color(0xFF327E3B),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewTaskScreen(),
                      ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
