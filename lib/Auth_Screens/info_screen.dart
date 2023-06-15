import 'package:dihliz_app/Auth_Screens/loginscreen.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController businessname = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(65.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/Artboard 17.png",width: 300,),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                  "Complete you info",
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter Your full name');
                      }
                    },
                    style: const TextStyle(color: Colors.black87),
                    controller: fullname,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                      hintText: ('ahmad ...'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 242, 238, 1),
                      labelText: "Full name",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter your user name');
                      }
                    },
                    style: const TextStyle(color: Colors.black87),
                    controller: username,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                      hintText: ('xyz ..'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 242, 238, 1),
                      labelText: "User name",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter your business name');
                      }
                    },
                    style: const TextStyle(color: Colors.black87),
                    controller: businessname,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                      hintText: ('xyz ..'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 242, 238, 1),
                      labelText: "Your business name",
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 260,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)
                          => LoginScreen()));
                        }

                      },
                      child: Text(
                        "Complete",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
