import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/to_do_editor.dart';
import 'my_list_class.dart';
class ListElement extends StatefulWidget{

  ToDo task;
  Function() delete;
  ListElement({
    Key? key, required this.task, required this.delete
  }) : super(key: key);

  @override
  State<ListElement> createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  @override
  Widget build(BuildContext context) {

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          borderOnForeground: true,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task.text,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ToDoEditor())
                        );
                      },
                      icon:const Icon(Icons.edit),
                    ),

                    IconButton(
                      onPressed: widget.delete ,
                      icon:const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
