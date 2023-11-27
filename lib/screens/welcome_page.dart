// ignore_for_file: camel_case_types, unnecessary_string_escapes

import 'package:flutter/material.dart';

import 'package:todov/screens/login.dart';
import 'package:todov/screens/signup.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asserts/images/welcomepage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Wel',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(252, 248, 248, 1),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 128, 49),
                      ),
                    ),
                    Text(
                      'come,',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(3, 98, 27, 0.7),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'To',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(252, 248, 248, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 128, 49),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'To',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(3, 98, 27, 0.7),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' Do',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(252, 248, 248, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 128, 49),
                      ),
                    ),
                    Text(
                      ' V.',
                      style: TextStyle(
                        backgroundColor: Color.fromRGBO(3, 98, 27, 0.7),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIN_Screen(),
                          ));
                    },
                    child: logsin("LogIn"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup_Screen()));
                    },
                    child: logsin("SignUp"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logsin(String content) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontFamily: null,
          color: Colors.green[900],
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
