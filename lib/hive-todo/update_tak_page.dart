import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpdateTaskPage extends StatefulWidget {
  const UpdateTaskPage({super.key, required this.index, required this.taks});
  final int? index;
  final String? taks;

  @override
  State<UpdateTaskPage> createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  TextEditingController taskController = TextEditingController();
  Box? myBox;

  @override
  void initState() {
    myBox = Hive.box('myBox');
    taskController.text = widget.taks!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update ToDo'),
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
            myBox!.putAt(widget.index!, taskController.text);
            Navigator.pop(context);
          }, child: Text('Update Task'))
        ],
      ),
    );
  }
}