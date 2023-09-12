// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jsonapp/UserModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userObject = UserModel(
      id: '001',
      fullname: 'Ruchit Rajeshbhai Bhut',
      email: 'ruchitbhut@gmail.com');

  String userJSON =
      '{"id": "001", "fullname": "Ruchit Rajeshbhai Bhut", "email": "ruchitbhut@gmail.com"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Serializetion
                  Map<String,dynamic> userMap = userObject.toMap();
                  var json = jsonEncode(userMap);
                  log(json);
                },
                child: const Text("Serialize"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  //De-Serialization
                  var decode = jsonDecode(userJSON);
                  Map<String,dynamic> userMap = decode;
                  UserModel newUser = UserModel.fromMap(userMap);
                  print(newUser);
                  // print(newUser.id);
                  // print(newUser.fullname);
                  // print(newUser.email);
                },
                child: const Text("De-Serialize"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
