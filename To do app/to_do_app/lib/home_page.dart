import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  //list to do tasks

  List toDoList = [
    
  ];

  //checkbox was tapped
  void ChechBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void savenewtask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task
  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsave: savenewtask,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deletetask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(167, 117, 7, 150),
      appBar: AppBar(
        title: Center(
          child: Text(
            'TO DO',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskname: toDoList[index][0],
              taskcompleted: toDoList[index][1],
              onchanged: (value) => ChechBoxChanged(value, index),
              deletefunction: (context) => deletetask(index),
            );
          }),
    );
  }
}
