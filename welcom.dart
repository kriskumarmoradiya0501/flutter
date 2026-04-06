import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String name;
  final String age;

  // Constructor
  WelcomePage({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 25)),
            SizedBox(height: 10),
            Text("Name: $name"),
            Text("Age: $age"),
          ],
        ),
      ),
    );
  }
}