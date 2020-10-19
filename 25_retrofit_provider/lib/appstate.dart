import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_request/models/todo.dart';
import 'package:retrofit_request/services/todo_service.dart';

class AppState with ChangeNotifier {
  AppState() {
    getTodoList();
  }

  List<Todo> listTodo = [];

  getTodoList() async {
    Dio dio = Dio();
    listTodo = await RestClient(dio).getTodos();
    notifyListeners();
  }

  setComplete(Todo todo) async {
    Dio dio = Dio();
    var newtodo = todo;
    newtodo.complete = !todo.complete;
    await RestClient(dio).updateTodo(todo.id, newtodo);
    notifyListeners();
  }
}