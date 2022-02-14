import 'package:flutter/material.dart';
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
  TextEditingController myText = TextEditingController();
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
            Visibility(
              child: Expanded(
                  child: TextField(
                    controller: myText,
                    decoration: InputDecoration(
                      hintText: 'type here',
                    ) ,
                  )
              ),
              visible: !widget.task.state,
            ),

            Visibility(
              child: Text(
                widget.task.text,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              visible: widget.task.state,
            ),

            Row(
              children: [
                Visibility(
                  child: IconButton(
                    onPressed: (){
                      setState((){
                        widget.task.state = true;
                        widget.task.text = myText.text.toString();
                      });
                    },
                    icon:const Icon(Icons.check),
                  ),
                  visible: !widget.task.state,
                ),

                Visibility(
                  child: IconButton(
                    onPressed: (){
                      setState((){
                        widget.task.state = false;
                      });
                    },
                    icon:const Icon(Icons.edit),
                  ),
                  visible: widget.task.state,
                ),

                Visibility(
                  child: IconButton(
                    onPressed: widget.delete ,
                    icon:const Icon(Icons.delete),
                  ),
                  visible: widget.task.state,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
