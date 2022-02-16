//This is a To-do List App
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/to_do_editor.dart';
import 'package:to_do_app/Pages/todo_home.dart';
import 'my_list_class.dart';

void main() {

  List <ToDo> toDoList = [];
  runApp(MaterialApp(
    routes: {
      '/': (context) => ToDoApp(toDoList: toDoList,),
      '/editor': (context) => ToDoEditor(),
    },
  ));
}




