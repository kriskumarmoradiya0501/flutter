import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool hall = false;
  bool kitchen = false;
  bool bedroom = false;
  bool lobby = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bulb Control")),

      body: Column(
        children: [

          // 🔹 Hall
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: hall,
                onChanged: (value) {
                  setState(() {
                    hall = value!;
                  });
                },
              ),
              Text("Hall"),
              Icon(Icons.lightbulb,
                  size: 40,
                  color: hall ? Colors.yellow : Colors.grey),
            ],
          ),

          // 🔹 Kitchen
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: kitchen,
                onChanged: (value) {
                  setState(() {
                    kitchen = value!;
                  });
                },
              ),
              Text("Kitchen"),
              Icon(Icons.lightbulb,
                  size: 40,
                  color: kitchen ? Colors.yellow : Colors.grey),
            ],
          ),

          // 🔹 Bedroom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: bedroom,
                onChanged: (value) {
                  setState(() {
                    bedroom = value!;
                  });
                },
              ),
              Text("Bedroom"),
              Icon(Icons.lightbulb,
                  size: 40,
                  color: bedroom ? Colors.yellow : Colors.grey),
            ],
          ),

          // 🔹 Lobby
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: lobby,
                onChanged: (value) {
                  setState(() {
                    lobby = value!;
                  });
                },
              ),
              Text("Lobby"),
              Icon(Icons.lightbulb,
                  size: 40,
                  color: lobby ? Colors.yellow : Colors.grey),
            ],
          ),

        ],
      ),
    );
  }
}