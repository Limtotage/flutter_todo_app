import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/constants/task_type.dart';
import 'package:flutter_todo_app/customItems/custom_button.dart';
import 'package:flutter_todo_app/customItems/gesture_icon_items.dart';
import 'package:flutter_todo_app/customItems/add_new_task_header.dart';
import 'package:flutter_todo_app/customItems/time_date_input_items.dart';
import 'package:flutter_todo_app/services/firestore.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  FirestoreService fire = FirestoreService();

  TaskType taskType = TaskType.note;
  void selectedIcon(TaskType slctd) {
    setState(() {
      taskType = slctd;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backGroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddHeaderItem(onTap: () {
                Navigator.of(context).pop();
              }),
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
                  controller: titleController,
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
                          GestureIconsItem(
                            path: "lib/assets/images/Task.png",
                            taskType: TaskType.note,
                            onIconSelected: selectedIcon,
                          ),
                          GestureIconsItem(
                            path: "lib/assets/images/Calendar.png",
                            taskType: TaskType.calendar,
                            onIconSelected: selectedIcon,
                          ),
                          GestureIconsItem(
                            path: "lib/assets/images/Goal.png",
                            taskType: TaskType.goal,
                            onIconSelected: selectedIcon,
                          )
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
                    CustomDateTime(
                      title: "Date",
                      controller: dateController,
                    ),
                    CustomDateTime(
                      title: "Time",
                      controller: timeController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: descriptionController,
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomButtonItem(
                    width: deviceWidth - 40,
                    height: 40,
                    text: "Save",
                    color: Color(0xFF327E3B),
                    textColor: Colors.white,
                    onPressed: () {
                      addTodoToService();
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTodoToService() {
    if (titleController.text != "") {
      fire.saveTodo(
          title: titleController.text,
          description: descriptionController.text,
          type: taskType.name);
    }
  }
}
