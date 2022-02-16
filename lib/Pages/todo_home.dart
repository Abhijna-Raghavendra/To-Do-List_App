import 'package:flutter/material.dart';
import '../list_element.dart';
import '../my_list_class.dart';

class ToDoApp extends StatefulWidget {
  List <ToDo> toDoList;
  ToDoApp({Key? key, required this.toDoList}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    if(ModalRoute.of(context)?.settings.arguments != null)
    {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      widget.toDoList.add(ToDo(data['text']));
      print('Inside modal route : data : ${data['text']}');
    }

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
          children: widget.toDoList.map((task) => ListElement(
            task: task,
            delete: (){
                widget.toDoList.remove(task);
                Navigator.pushNamed(context, '/');
            },
          )).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/editor');
          },
          child:const Icon(
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