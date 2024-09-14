import 'package:batch3/sqflite/screens/home_screen.dart';
import 'package:batch3/sqflite/services/sqfflite_services.dart';
import 'package:flutter/material.dart';

import '../models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen(
      {super.key, required this.id, required this.description});
  final int id;
  final String description;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController idConteroller = TextEditingController();
  TextEditingController desConteroller = TextEditingController();
  @override
  void initState() {
    idConteroller.text = widget.id.toString();
    desConteroller.text = widget.description.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Update Note'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: idConteroller,
                decoration: InputDecoration(
                    hintText: 'Enter your id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: desConteroller,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Enter your description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1))),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {

                  var data = Note(
                    id: int.parse(idConteroller.text),
                    description: desConteroller.text
                  );
                  
                  Sqflite().updateNote(data);
                  Navigator.pop(context);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MyHomePage()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
