import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaxApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MaxApp extends StatefulWidget {
  @override
  _MaxAppState createState() => _MaxAppState();
}

class _MaxAppState extends State<MaxApp> {
  double a = 1;
  double b = 1;
  double c = 1;

  String result = "";

  void findMax() {
    double max = a;

    if (b > max) max = b;
    if (c > max) max = c;

    setState(() {
      result = "Max Value = ${max.toInt()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Maximum"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            // Slider A
            Text("Value of A: ${a.toInt()}"),
            Slider(
              value: a,
              min: 1,
              max: 5,
              divisions: 100,
              onChanged: (value) {
                setState(() {
                  a = value;
                });
              },
            ),

            // Slider B
            Text("Value of B: ${b.toInt()}"),
            Slider(
              value: b,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (value) {
                setState(() {
                  b = value;
                });
              },
            ),

            // Slider C
            Text("Value of C: ${c.toInt()}"),
            Slider(
              value: c,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (value) {
                setState(() {
                  c = value;
                });
              },
            ),

            SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: findMax,
              child: Text("Show Max"),
            ),

            SizedBox(height: 20),

            // Result
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}