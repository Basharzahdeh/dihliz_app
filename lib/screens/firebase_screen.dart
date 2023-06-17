import 'package:dihliz_app/screens/viewdata_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FireBaseScreen extends StatefulWidget {
  const FireBaseScreen({super.key});

  @override
  State<FireBaseScreen> createState() => _FireBaseScreenState();
}

class _FireBaseScreenState extends State<FireBaseScreen> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Screen"),
      ),
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something wrong with firebase");
          } else if (snapshot.hasData) {
            return content();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget content() {
    DatabaseReference _testRef=FirebaseDatabase.instance.ref().child("const");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async{_testRef.child("count").set(40);},
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Add Data",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        SizedBox(height: 50,),
          GestureDetector(
            onTap: () async{_testRef.child("count").remove();},
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Remove Data",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        SizedBox(height: 50,),
          GestureDetector(
            onTap: () async{
              Map<String,dynamic> data={
                "count":"30",
              };
              _testRef.child("count").update(data);},
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Update Data",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),SizedBox(height: 50,),
          GestureDetector(
            onTap: () async{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) =>ViewDataScreen()));
              },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "fetch Data",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
