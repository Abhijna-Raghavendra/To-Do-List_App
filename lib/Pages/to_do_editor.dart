
import 'package:flutter/material.dart';

void main()
{
  runApp(const ToDoEditor());
}

class ToDoEditor extends StatefulWidget {
  const ToDoEditor({Key? key}) : super(key: key);

  @override
  _ToDoEditorState createState() => _ToDoEditorState();
}

class _ToDoEditorState extends State<ToDoEditor> {
  TextEditingController myText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: TextField(
        controller: myText,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/', arguments:{'text': myText.text});
        },
        child: const Icon(
          Icons.check,
          size: 40.0,
        ),
        backgroundColor: Colors.amber[500],
        foregroundColor: Colors.black,
      ),
    );
  }
}

