import 'package:batch3/hive-todo/add_tak_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'update_tak_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        backgroundColor: Colors.teal,
        title: Text('Hive ToDo List App'),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTaskPage()));
          }, child: Text('Add Task'))
        ],
      ),
      body: myBox!.keys.toList().length > 0 ?
      ValueListenableBuilder(
      valueListenable: Hive.box('myBox').listenable(), 
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: myBox!.keys.toList().length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTaskPage(
                  index: index,
                  taks: myBox!.getAt(index).toString(),
                )));
              },
              onLongPress: () {
                myBox!.deleteAt(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5,top: 5),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3)
                  ),
                  child: Center(child: Text(myBox!.getAt(index).toString())),
                ),
              ),
            );
          },
        );
      },): SizedBox(),
    );
  }
}