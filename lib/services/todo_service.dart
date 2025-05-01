import 'dart:convert';

import 'package:flutter_todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos";

  Future<List<ToDo>> getTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<ToDo> todos = List.empty(growable: true);

    resp.forEach((element) {
      todos.add(ToDo.fromJson(element));
    });
    return todos;
  }
}
