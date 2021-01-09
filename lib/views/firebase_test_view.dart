import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestView extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Alarm');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetTaskData('task');
        }
        return LinearProgressIndicator();
      },
    );
  }

}

class GetTaskData extends StatelessWidget {
  final String documentId;
  GetTaskData(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    return FutureBuilder<DocumentSnapshot>(
      future: tasks.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(data['taskText']);
        }
        return Text('loaddding');
      },
    );
  }
}