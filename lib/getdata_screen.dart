import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetUserName extends StatelessWidget {
final String documentId;
GetUserName({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference Product=FirebaseFirestore.instance.collection("Product");
    return FutureBuilder<DocumentSnapshot>(
      future: Product.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Name:${data["Name"]}");
        }
        return Text("loading..");
      },
    );
  }
}
class GetWidth extends StatelessWidget {
  final String documentId1;
  GetWidth({required this.documentId1});
  @override
  Widget build(BuildContext context) {
    CollectionReference Product1=FirebaseFirestore.instance.collection("Product");
    return FutureBuilder<DocumentSnapshot>(
      future: Product1.doc(documentId1).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text("Width:${data["Width"]}");
        }
        return Text("loading..");
      },
    );
  }
}
class GetStockId extends StatelessWidget {
  final String documentId2;
  GetStockId({required this.documentId2});
  @override
  Widget build(BuildContext context) {
    CollectionReference Product2=FirebaseFirestore.instance.collection("Product");
    return FutureBuilder<DocumentSnapshot>(
      future: Product2.doc(documentId2).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          return Text("Stock ID:${data["Stock ID"]}");
        }
        return Text("loading..");
      },
    );
  }
}
