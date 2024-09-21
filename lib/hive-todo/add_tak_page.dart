import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController taskController = TextEditingController();
  Box? myBox;

  @override
  void initState() {
    myBox = Hive.box('myBox');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ToDo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: taskController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: (){
            myBox!.add(taskController.text);
            Navigator.pop(context);
          }, child: Text('Add Task'))
        ],
      ),
    );
  }
}