import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExternalApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExternalApp extends StatefulWidget {
  @override
  _ExternalAppState createState() => _ExternalAppState();
}

class _ExternalAppState extends State<ExternalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExternalApp")),
      body: Column(
        children: [
          Text("Hello Flutter"),
        ],
      ),
    );
  }
}