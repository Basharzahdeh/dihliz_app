import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Providers/inventory_provider.dart';


class AddStockScreen extends StatefulWidget {
  const AddStockScreen({Key? key}) : super(key: key);

  @override
  State<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _StockId = TextEditingController();

  TextEditingController _Weidth = TextEditingController();
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();
  FocusNode fieldthree = FocusNode();
  final ImagePicker _picker = ImagePicker();

  XFile? pikedImagenew;

  bool check = false;

  void getcamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//-----------------------3)check image null ?
    if (image == null) {
      return;
    } else {
      setState(() {
        check = true;
      });
    }
    setState(() {
//-----------------------3-2) assign value to9
// File
      pikedImagenew = image;
      print(pikedImagenew);
    });
  }
  final productdata=FirebaseFirestore.instance.collection("Product").get();

  @override
  Widget build(BuildContext context) {
    final getData1 = Provider.of<InventoryProvidr>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stock'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      check == false
                          ? InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: AssetImage(""),
                                radius: 70,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: pikedImagenew == null
                                  ? null
                                  : FileImage(File(pikedImagenew!.path)),
                              radius: 70,
                            ),
                      Container(
                          margin: EdgeInsets.only(top: 80, left: 90),
                          child: IconButton(
                              onPressed: () {
                                getcamera();
                              },
                              icon: Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.red,
                                size: 45,
                              ))),
                    ],
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Stock Name '),
                controller: _nameController,
                focusNode: fieldone,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(fieldone);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Stock id '),
                controller: _StockId,
                focusNode: fieldtwo,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(fieldtwo);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'stock weidth '),
                controller: _Weidth,
                focusNode: fieldthree,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(fieldthree);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(getData1.addItem(
                      '${_StockId.text}',
                      '${_nameController.text}',
                      File(pikedImagenew!.path),
                      '${_Weidth.text}',
                    ));
                    Map<String,dynamic> data={
                      "Name":_nameController.text,"Width":_Weidth.text,"Stock ID":_StockId.text};
                      FirebaseFirestore.instance.collection("Product").add(data);

                  },
                  child: Text('Add Stock'))
            ],
          ),
        ),
      ),
    );
  }
}
