import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db.dart';

class Getpage extends StatefulWidget {
  const Getpage({super.key});

  @override
  State<Getpage> createState() => _GetpageState();
}

class _GetpageState extends State<Getpage> {
    String name='';
    int age=0;
    String email='';

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final db = await DatabaseHelper.instance.database;
    print(db);
    return await db.query('users');
  }

  void getAllData() async {
    List<Map<String, dynamic>>   data = await fetchUsers();
    setState(() {
      name=data[0]['name'];
      age=data[0]['age'];
      email=data[0]['email'];

    });
  }

  @override
  void initState() {
    getAllData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name),
          Text(age.toString()),
          Text(email),

        ],
      ),
    );
  }
}
