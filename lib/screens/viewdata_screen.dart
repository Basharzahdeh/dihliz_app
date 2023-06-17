import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewDataScreen extends StatelessWidget {
  Query getdata = FirebaseDatabase.instance.ref().child("const");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back)),),
      body: FirebaseAnimatedList(
        query: getdata,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return Center(
            child: Text(
              snapshot.child("count").value.toString(),
              style: TextStyle(fontSize: 70,color: Colors.red),
          ),
          );
        },
      ),
    );
  }
}
