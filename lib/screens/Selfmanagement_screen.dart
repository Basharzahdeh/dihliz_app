import 'Inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/selfprovider.dart';
import '../constants.dart';

class SelfManagementScreen extends StatefulWidget {
  const SelfManagementScreen({Key? key}) : super(key: key);

  @override
  State<SelfManagementScreen> createState() => _SelfManagementScreenState();
}

class _SelfManagementScreenState extends State<SelfManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final getData1 = Provider.of<SelfProvider>(context);
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
        title: Text("Self-management of inventory"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Operation",
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 19),
                height: 420,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: getData1.sel.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InventoryScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
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
                                  "${getData1.sel[index].name}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(95, 99, 100, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${getData1.sel[index].description}  ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(180, 180, 180, 1)),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.arrow_circle_right),
                                    Text("transfer")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "${getData1.sel[index].Image}",
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
                ),
              ),
              Text(
                "Stocks",
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: 10,
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
                          style: TextStyle(
                              color: Color.fromRGBO(180, 180, 180, 1)),
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
                          "assets/7.png",
                          width: 135,
                          height: 130,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
