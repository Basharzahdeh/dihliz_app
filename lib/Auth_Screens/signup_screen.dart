import 'package:dihliz_app/Auth_Screens/info_screen.dart';
import 'package:dihliz_app/Auth_Screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                Image.asset(
                  "assets/Artboard 16.png",
                  width: 220,
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                    child: Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your your data to register in\nour warehouse",
                  style: TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter Your email');
                      }
                    },
                    style: const TextStyle(color: Colors.black87),
                    controller: email,
                    decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                      hintText: ('example@example.com'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 242, 238, 1),
                      labelText: "email",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter your password');
                      }
                    },
                    style: const TextStyle(color: Colors.black87),
                    controller: password,
                    decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                      hintText: ('**** ****'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 242, 238, 1),
                      labelText: "password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have any account?",
                      style: TextStyle(color: Color.fromRGBO(91, 91, 91, 1)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        ('Sign In'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email.text, password: password.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
