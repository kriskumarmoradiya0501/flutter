import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  String gender = "Male";

  bool english = true;
  bool gujarati = false;
  bool hindi = false;

  String result = "";

  void register() {
    String lang = "";

    if (english) lang += "English ";
    if (gujarati) lang += "Gujarati ";
    if (hindi) lang += "Hindi ";

    setState(() {
      result =
      "First Name: ${fname.text}\n"
          "Last Name: ${lname.text}\n"
          "Gender: $gender\n"
          "Languages: $lang";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // First Name
            TextField(
              controller: fname,
              decoration: InputDecoration(labelText: "First Name"),
            ),

            // Last Name
            TextField(
              controller: lname,
              decoration: InputDecoration(labelText: "Last Name"),
            ),

            SizedBox(height: 10),

            // Gender
            Text("Gender"),
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
            RadioListTile(
              title: Text("Other"),
              value: "Other",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            // Languages
            Text("Languages"),
            CheckboxListTile(
              title: Text("English"),
              value: english,
              onChanged: (value) {
                setState(() {
                  english = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Gujarati"),
              value: gujarati,
              onChanged: (value) {
                setState(() {
                  gujarati = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Hindi"),
              value: hindi,
              onChanged: (value) {
                setState(() {
                  hindi = value!;
                });
              },
            ),

            SizedBox(height: 10),

            // Button
            ElevatedButton(
              onPressed: register,
              child: Text("Register"),
            ),

            SizedBox(height: 10),

            // Result
            Text(result),
          ],
        ),
      ),
    );
  }
}