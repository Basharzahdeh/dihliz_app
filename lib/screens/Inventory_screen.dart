import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dihliz_app/getdata_screen.dart';
import 'package:path/path.dart';

import '../Providers/inventory_provider.dart';
import 'addInventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

bool swClick = true;

class _InventoryScreenState extends State<InventoryScreen> {
  List<String> docIds = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection("Product")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    final getdata = Provider.of<InventoryProvidr>(context);
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
        title: Text("Enter inventory"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                          items: [
                            DropdownMenuItem(
                                child: InkWell(child: Text('Accpeted')),
                                value: true),
                            DropdownMenuItem(
                                child: InkWell(child: Text('no')), value: false),
                          ],
                          onChanged: (value) {
                            setState(() {
                              swClick = value!;
                              print(swClick);
                            });
                          },
                          icon: Icon(Icons.filter_list)),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(39, 50, 56, 1)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddStockScreen()));
                        },
                        child: Text(
                          "Add Stock",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 19),
                height: 420,
                child: getdata.inven.length == 0
                    ? Container(
                        child: Center(child: Text('No item')),
                      )
                    :
                        ListView.builder(
                          itemCount: getdata.inven.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(10),
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "name ${getdata.inven.values.toList()[index].name}  ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                180, 180, 180, 1)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Width ${getdata.inven.values.toList()[index].weidth}  ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    180, 180, 180, 1)),
                                          ),
                                          Text(
                                            "Stoc Id ${getdata.inven.values.toList()[index].stockid}  ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    180, 180, 180, 1)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("View Details"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            "Accepted",
                                            style: TextStyle(color: Colors.green),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: FileImage(File(getdata
                                            .inven.values
                                            .toList()[index]
                                            .Image!
                                            .path)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),



                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
