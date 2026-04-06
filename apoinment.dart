import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppointmentApp extends StatefulWidget {
  @override
  _AppointmentAppState createState() => _AppointmentAppState();
}

class _AppointmentAppState extends State<AppointmentApp> {

  DateTime selectedDate = DateTime.now();

  List<String> slots = [
    "10 to 11",
    "11 to 12",
    "12 to 1",
    "4 to 5",
    "5 to 6",
    "6 to 7"
  ];

  String selectedSlot = "10 to 11";

  List<String> bookings = [];

  String message = "";

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void bookSlot() {
    String booking = "${selectedDate.toString().split(" ")[0]} - $selectedSlot";

    if (bookings.contains(booking)) {
      setState(() {
        message = "Slot not available";
      });
    } else {
      setState(() {
        bookings.add(booking);
        message = "";
      });
    }
  }

  void reset() {
    setState(() {
      bookings.clear();
      message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment App"),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              child: Text("${bookings.length}"),
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            // Date Picker
            TextButton(
              onPressed: pickDate,
              child: Text("Date: ${selectedDate.toString().split(" ")[0]}"),
            ),

            // Dropdown
            DropdownButton<String>(
              value: selectedSlot,
              items: slots.map((slot) {
                return DropdownMenuItem(
                  value: slot,
                  child: Text(slot),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSlot = value!;
                });
              },
            ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: bookSlot, child: Text("Book")),
                ElevatedButton(onPressed: reset, child: Text("Reset")),
              ],
            ),

            SizedBox(height: 10),

            // ListView
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(bookings[index]),
                  );
                },
              ),
            ),

            // Message
            Text(
              message,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}