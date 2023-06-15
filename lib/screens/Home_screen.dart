import 'package:dihliz_app/screens/googlemap_screen.dart';
import 'package:flutter/material.dart';

import 'Selfmanagement_screen.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

void signOutUser() async {
  try {
    await _firebaseAuth.signOut();
    print('User logged out');
  } catch (error) {
    print('Error logging out: $error');
  }
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home"), centerTitle: true),
        backgroundColor: Constants.backGroundColor,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                IconButton(onPressed: signOutUser, icon: Icon(Icons.power_settings_new)) ,
            Text(
              "Inventory",
              style:
                  TextStyle(fontSize: 19, color: Color.fromRGBO(47, 52, 55, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..push(MaterialPageRoute(
                      builder: (context) => GoogleMapScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Self-management of inventory",
                            style: TextStyle(
                                color: Color.fromRGBO(95, 99, 100, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You can enter ,withdaw and transfer\nthe inventory alone   ",
                            style: TextStyle(
                                color: Color.fromRGBO(180, 180, 180, 1)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.square),
                              Text("Control Panel")
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/2.png",
                            width: 95,
                            height: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Call Customer care",
                          style: TextStyle(
                              color: Color.fromRGBO(95, 99, 100, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "You can add your inventory through\nCustomer care",
                          style: TextStyle(
                              color: Color.fromRGBO(180, 180, 180, 1)),
                        ),
                        Row(
                          children: [Icon(Icons.call), Text("Call Now")],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/1.png",
                          width: 95,
                          height: 100,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Monitoring",
              style:
                  TextStyle(fontSize: 19, color: Color.fromRGBO(47, 52, 55, 1)),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(39, 50, 56, 1)),
              padding: EdgeInsets.all(23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stock monitoring",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Analyses of your inventory\ncan be found",
                        style:
                            TextStyle(color: Color.fromRGBO(180, 180, 180, 1)),
                      ),
                      SizedBox(
                        height: 63,
                      ),
                      Text(
                        "View",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/3.png",
                        width: 135,
                        height: 130,
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        )));
  }
}
