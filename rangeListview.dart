import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RangeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RangeApp extends StatefulWidget {
  @override
  _RangeAppState createState() => _RangeAppState();
}

class _RangeAppState extends State<RangeApp> {
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  List<int> numbers = [];

  void showRange() {
    int start = int.parse(startController.text);
    int end = int.parse(endController.text);

    List<int> temp = [];

    for (int i = start; i <= end; i++) {
      temp.add(i);
    }

    setState(() {
      numbers = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Range App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            // Start Number
            TextField(
              controller: startController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Start Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            // End Number
            TextField(
              controller: endController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "End Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            // Button
            ElevatedButton(
              onPressed: showRange,
              child: Text("Show Range"),
            ),

            SizedBox(height: 10),

            // ListView
            Expanded(
              child: ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(numbers[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}