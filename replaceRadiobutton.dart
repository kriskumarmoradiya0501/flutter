import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateCityRadioApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StateCityRadioApp extends StatefulWidget {
  @override
  _StateCityRadioAppState createState() => _StateCityRadioAppState();
}

class _StateCityRadioAppState extends State<StateCityRadioApp> {

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
      appBar: AppBar(title: Text("Radio Example")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                selectedCity = null;
              });
            },
          ),

          SizedBox(height: 10),

          // 🔹 Radio Buttons for Cities
          if (selectedState != null)
            Column(
              children: cities[selectedState!]!.map((city) {
                return RadioListTile<String>(
                  title: Text(city),
                  value: city,
                  groupValue: selectedCity,
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                );
              }).toList(),
            ),

          SizedBox(height: 20),

          // 🔹 Show Selected City
          Text("Selected City: ${selectedCity ?? ""}"),

        ],
      ),
    );
  }
}