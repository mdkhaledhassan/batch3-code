import 'package:batch3/sqflite/screens/add_note_screen.dart';
import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../services/sqfflite_services.dart';
import 'edit_note_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Sqflite sqflite = Sqflite();

  List<Note> noteList = [];

  getData() async {
    final data = await sqflite.getNotes();

    setState(() {
      noteList = data;
    });
  }

  @override
  void initState() {
    sqflite.intDB().whenComplete(() async {
      await getData();
      setState(() {
        
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('SQFLite'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AddNoteScreen()));
                },
                icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text('Add Note',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                    ),
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(
                noteList.length,
                (index) => 
                Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> EditNoteScreen(
                            id: noteList[index].id!.toInt(),
                            description: noteList[index].description.toString(),
                          )));
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text(
                                      'Are you sure to delete this note?'),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Sqflite().deleteNote(noteList[index].id!.toInt());

                                            getData();

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4))
                              ],
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID: ${noteList[index].id}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Description: ${noteList[index].description}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
