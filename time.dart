import 'package:flutter/material.dart';

void main() {
  runApp(TimeApp());
}

class TimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimePickerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {

  TimeOfDay selectedTime = TimeOfDay.now();
  List<String> timeList = [];

  // Function to pick time
  void pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Function to add time to list
  void addTime() {
    String formattedTime = selectedTime.format(context);

    setState(() {
      timeList.add(formattedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Picker App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            // Show Selected Time
            Text(
              "Selected Time: ${selectedTime.format(context)}",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            // Pick Time Button
            ElevatedButton(
              onPressed: pickTime,
              child: Text("Pick Time"),
            ),

            SizedBox(height: 10),

            // Add Button
            ElevatedButton(
              onPressed: addTime,
              child: Text("Add"),
            ),

            SizedBox(height: 20),

            // Display List
            Expanded(
              child: ListView.builder(
                itemCount: timeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text(timeList[index]),
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