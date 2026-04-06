import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateCityApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StateCityApp extends StatefulWidget {
  @override
  _StateCityAppState createState() => _StateCityAppState();
}

class _StateCityAppState extends State<StateCityApp> {

  String? selectedState;
  String? selectedCity;

  List<String> states = ["Gujarat", "Maharashtra", "Rajasthan"];

  Map<String, List<String>> cities = {
    "Gujarat": ["Ahmedabad", "Surat", "Vadodara"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown Example")),
      body: Column(
        children: [

          // 🔹 State Dropdown
          DropdownButton<String>(
            hint: Text("Select State"),
            value: selectedState,
            items: states.map((state) {
              return DropdownMenuItem(
                value: state,
                child: Text(state),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedState = value;
                selectedCity = null; // reset city
              });
            },
          ),

          // 🔹 City Dropdown
          if (selectedState != null)
            DropdownButton<String>(
              hint: Text("Select City"),
              value: selectedCity,
              items: cities[selectedState!]!.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),

          SizedBox(height: 20),

          // 🔹 Show Selected City
          Text("Selected City: ${selectedCity ?? ""}"),

        ],
      ),
    );
  }
}