import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {

  bool selectAll = false;
  bool pizza = false;
  bool fries = false;
  bool drink = false;

  int total = 0;
  String selectedItems = "";

  void updateData() {
    total = 0;
    selectedItems = "";

    if (pizza) {
      total += 250;
      selectedItems += "Pizza ";
    }
    if (fries) {
      total += 80;
      selectedItems += "Fries ";
    }
    if (drink) {
      total += 50;
      selectedItems += "Colddrink ";
    }

    setState(() {});
  }

  void handleSelectAll(bool? value) {
    selectAll = value!;
    pizza = value;
    fries = value;
    drink = value;

    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food App")),
      body: Column(
        children: [

          // Select All
          CheckboxListTile(
            title: Text("Select All"),
            value: selectAll,
            onChanged: (value) {
              handleSelectAll(value);
            },
          ),

          // Pizza
          CheckboxListTile(
            title: Text("Pizza (250)"),
            value: pizza,
            onChanged: (value) {
              pizza = value!;
              selectAll = pizza && fries && drink;
              updateData();
            },
          ),

          // Fries
          CheckboxListTile(
            title: Text("French Fries (80)"),
            value: fries,
            onChanged: (value) {
              fries = value!;
              selectAll = pizza && fries && drink;
              updateData();
            },
          ),

          // Drink
          CheckboxListTile(
            title: Text("Colddrink (50)"),
            value: drink,
            onChanged: (value) {
              drink = value!;
              selectAll = pizza && fries && drink;
              updateData();
            },
          ),

          SizedBox(height: 20),

          // Selected Items
          Text("Selected Items: $selectedItems"),

          // Total Price
          Text("Total Price: ₹$total"),

        ],
      ),
    );
  }
}