//This is a To-do List App
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'list_element.dart';
import 'my_list_class.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<ToDo> toDoList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 25.0),
              Icon(
                Icons.assignment,
                size: 50.0,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.amber[500],
          foregroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: toDoList.map((task) => ListElement(
            task: task,
            delete: (){
              setState(() {
                toDoList.remove(task);
              });
            },
          )).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              toDoList.add(ToDo('new activity',false));
            });
          },
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          backgroundColor: Colors.amber[500],
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}


