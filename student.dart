import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttendanceApp extends StatefulWidget {
  @override
  _AttendanceAppState createState() => _AttendanceAppState();
}

class _AttendanceAppState extends State<AttendanceApp> {

  DateTime selectedDate = DateTime.now();
  String subject = "Maths";

  List<String> maths = ["Vikas", "Rohan", "Tanisha", "Rucha", "Pavan"];
  List<String> science = ["Harsh", "Ved", "Vihan", "Chinar", "Dev"];

  List<bool> isChecked = [false, false, false, false, false];

  String presentText = "";
  String absentText = "";

  int presentCount = 0;
  int absentCount = 0;

  List<String> getStudents() {
    return subject == "Maths" ? maths : science;
  }

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      DateTime today = DateTime.now();

      // Validation
      if (picked.isBefore(today.subtract(Duration(days: 1))) ||
          picked.isAfter(today)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid Date")),
        );
      } else {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  void submit() {
    List<String> students = getStudents();

    List<String> present = [];
    List<String> absent = [];

    for (int i = 0; i < students.length; i++) {
      if (isChecked[i]) {
        present.add(students[i]);
      } else {
        absent.add(students[i]);
      }
    }

    setState(() {
      presentText = present.join("\n");
      absentText = absent.join("\n");
      presentCount = present.length;
      absentCount = absent.length;
    });
  }

  void reset() {
    setState(() {
      isChecked = [false, false, false, false, false];
      presentText = "";
      absentText = "";
      presentCount = 0;
      absentCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> students = getStudents();

    return Scaffold(
      appBar: AppBar(title: Text("Attendance App")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            // Date + Subject Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: pickDate,
                  child: Text("Date: ${selectedDate.toString().split(" ")[0]}"),
                ),

                DropdownButton<String>(
                  value: subject,
                  items: ["Maths", "Science"].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      subject = value!;
                      isChecked = [false, false, false, false, false];
                    });
                  },
                ),
              ],
            ),

            // Checkbox List
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(students[index]),
                    value: isChecked[index],
                    onChanged: (value) {
                      setState(() {
                        isChecked[index] = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: submit, child: Text("Submit")),
                ElevatedButton(onPressed: reset, child: Text("Reset")),
              ],
            ),

            SizedBox(height: 10),

            // Result
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Present ($presentCount)"),
                      Text(presentText),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Absent ($absentCount)"),
                      Text(absentText),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}