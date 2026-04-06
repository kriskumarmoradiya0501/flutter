import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController idController = TextEditingController();

  String dob = "";
  bool flutter = false;
  bool java = false;
  bool dotnet = false;
  String gender = "Male";

  String result = "";

  // 📅 Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        dob = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // 📌 Show Data
  void showData() {
    List<String> skills = [];

    if (flutter) skills.add("Flutter");
    if (java) skills.add("Java");
    if (dotnet) skills.add(".NET");

    setState(() {
      result =
      "Student ID: ${idController.text}\nDate of Birth: $dob\nSkills: ${skills.join(", ")}\n Selected Gender: $gender";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Form")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            // 🧾 Student ID
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: "Student ID",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            // 📅 Date Picker
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: dob == "" ? "Select Date of Birth" : dob,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: pickDate,
                )
              ],
            ),

            SizedBox(height: 10),

            // ✅ Checkboxes
            CheckboxListTile(
              title: Text("Flutter"),
              value: flutter,
              onChanged: (val) {
                setState(() {
                  flutter = val!;
                });
              },
            ),

            CheckboxListTile(
              title: Text("Java"),
              value: java,
              onChanged: (val) {
                setState(() {
                  java = val!;
                });
              },
            ),

            CheckboxListTile(
              title: Text(".NET"),
              value: dotnet,
              onChanged: (val) {
                setState(() {
                  dotnet = val!;
                });
              },
            ),

            SizedBox(height: 10),

            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            // Female
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            SizedBox(height: 10),


            // 🔘 Show Button
            ElevatedButton(
              onPressed: showData,
              child: Text("Show"),
            ),

            SizedBox(height: 10),

            // 📦 Result Box
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(result),
            ),
          ],
        ),
      ),
    );
  }
}