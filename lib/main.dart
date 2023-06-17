import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dihliz_app/Auth_Screens/loginscreen.dart';
import 'package:dihliz_app/screens/Home_screen.dart';
import 'package:dihliz_app/screens/firebase_screen.dart';
import 'package:dihliz_app/screens/splash%20screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Providers/inventory_provider.dart';
import 'Providers/selfprovider.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SelfProvider()),
      ChangeNotifierProvider(create: (_) => InventoryProvidr()),
    ],
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FireBaseScreen(),
      builder: EasyLoading.init(),
    );
  }
}
