import 'package:batch3/firebase/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../login_screen.dart';

class FirebaseService{
  signIn({required String emailAddress, required String password, context}) async {
    try {
      final data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
      );
      if(data.user!.uid.isNotEmpty)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signUp({required String emailAddress, required String password, context}) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if(data.user!.uid.isNotEmpty)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  addNote({required String title, required String des}) async {
    await FirebaseFirestore.instance.collection('Notes').add({
      'title': title,
      'des' : des
    });
  }

  getNotes() {
    Stream<QuerySnapshot> data = FirebaseFirestore.instance.collection('Notes').snapshots();
    return data;
  }

  upateNote({required String id, required String title, required String des}) async {
    await FirebaseFirestore.instance.collection('Notes').doc(id).update({
      'title': title,
      'des' : des
    });
  }

  deleteNote({required String id}) async {
    await FirebaseFirestore.instance.collection('Notes').doc(id).delete();
  }
}