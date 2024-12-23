import 'package:flutter/material.dart';
import 'package:log1app/pages/seclogin.dart';
import 'package:log1app/pages/admin.dart';

class MenuSystem extends StatefulWidget {
  const MenuSystem({super.key});

  @override
  State<MenuSystem> createState() => _MenuSystemState();
}

class _MenuSystemState extends State<MenuSystem> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  String? _errorMessage;
  bool _isPasswordHidden = true;

  void login() {
    String uname = username.text;
    String psswd = password.text;
    if (uname == "admin" && psswd == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Viewallvisitor()),
      );
    } else if (uname == "sbce" && psswd == "sbce123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecurityLogin()),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid username or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.universitykart.com//Content/upload/admin/2lpgcq2g.3mw.jpg"),
                  radius: 78,
                ),
                SizedBox(height: 5),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Username",
                    hintText: "Enter your username",
                    prefixIcon: Icon(Icons.verified_user),
                    prefixIconColor: Colors.black12,
                  ),
                ),),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                child: TextField(
                  controller: password,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock_rounded),
                    prefixIconColor: Colors.black12,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                  ),
                ),),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: login,
                      child: Text("LOG IN"),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
