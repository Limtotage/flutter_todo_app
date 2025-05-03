import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/task_type.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/services/firestore.dart';

class Todoitem extends StatefulWidget {
  const Todoitem(
      {super.key,
      required this.docId,
      required this.task,
      required this.completed});
  final String docId;
  final bool completed;
  final Task task;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.docId),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (!widget.completed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("The task hasn't been completed."),
            ),
          );
          return false; // silmeye izin verme
        }
        return true;
      },
      onDismissed: (direction) {
        firestoreService.deleteTodo(docID: widget.docId);
      },
      child: Card(
        key: ValueKey(widget.docId),
        color: widget.completed ? Colors.grey : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.task.type == TaskType.note.name
                  ? Image.asset("lib/assets/images/Task.png")
                  : widget.task.type == TaskType.calendar.name
                      ? Image.asset("lib/assets/images/Calendar.png")
                      : Image.asset("lib/assets/images/Goal.png"),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          decoration: widget.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    Text(
                      widget.task.description,
                      style: TextStyle(
                          color: Color.fromARGB(255, 81, 81, 81),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: widget.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
              ),
              Checkbox(
                  activeColor: Color(0xFF327E3B),
                  value: widget.completed,
                  onChanged: (val) async {
                    await firestoreService.updateTodo(
                        docID: widget.docId, newValue: !(widget.completed));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
