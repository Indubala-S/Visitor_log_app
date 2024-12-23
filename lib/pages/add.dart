import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addvisitor extends StatelessWidget {
  Addvisitor({super.key});

  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController purpose = TextEditingController();
  final TextEditingController whomToMeet = TextEditingController();

  Future<void> sendData() async {
    final url = Uri.parse("https://log-app-demo-api.onrender.com/addvisitor");
    try {
      await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstname": fname.text,
          "lastname": lname.text,
          "purpose": purpose.text,
          "whomToMeet": whomToMeet.text
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout_sharp),
            onPressed: () =>Navigator.pop(context),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add Visitor",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
                SizedBox(height: 80),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: fname,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "Enter the first name",
                    prefixIcon: Icon(Icons.person_add),
                    prefixIconColor: Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),),
                SizedBox(height: 15),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: lname,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Enter the last name",
                    prefixIcon: Icon(Icons.person_add),
                    prefixIconColor: Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),),
                SizedBox(height: 15),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: purpose,
                  decoration: InputDecoration(
                    labelText: "Purpose",
                    hintText: "Enter the purpose",
                    prefixIcon: Icon(Icons.pending_actions_outlined),
                    prefixIconColor: Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),),
                SizedBox(height: 15),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: whomToMeet,
                  decoration: InputDecoration(
                    labelText: "Whom to Meet",
                    hintText: "Enter whom to meet",
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.black12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),),
                SizedBox(height: 15),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await sendData();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),

                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Clicked..!");
                  },
                  child: Text("Click here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
