import 'package:batch3/firebase/add_note_screen.dart';
import 'package:batch3/firebase/services/firebase_service.dart';
import 'package:batch3/firebase/update_note_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNoteScreen()));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(data!.email.toString()),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: ()  {
              FirebaseService().signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white
            ),
            child: Text('Logout')),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseService().getNotes(), 
              builder: (context, value){
                if(value.connectionState == ConnectionState.waiting)
                {
                  return CircularProgressIndicator();
                }
                else
                {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.data!.docs.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: GestureDetector(
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNoteScreen(
                          data: value.data!.docs[index],
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
                                              FirebaseService().deleteNote(id: value.data!.docs[index].id.toString());
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 15
                              )
                            ],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title: ${value.data!.docs[index]['title']}'),
                                Text('Description: ${value.data!.docs[index]['des']}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                }
              }),
            )
            
          ],
        ),
      ),
    );
  }
}