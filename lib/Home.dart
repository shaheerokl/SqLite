import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GetPage.dart';
import 'db.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController age = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: userName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "UserName"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: place,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Place"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: age,
            keyboardType: TextInputType.text,
            decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: "Age"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async{
            int a=  await  insertUser({"name":"john",'email':"abc@gmail.com",'age':90});
            print(a);
              },
              child: Text("Save")),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Getpage()));
              },
              icon: Icon(
                CupertinoIcons.arrow_right,
                size: 30,
              ))
        ],
      ),
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('users', user);
  }
}
