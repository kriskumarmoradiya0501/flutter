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

  // Stock
  int breakfast = 30;
  int lunch = 40;
  int dinner = 30;

  // Prices
  int bPrice = 40;
  int lPrice = 80;
  int dPrice = 60;

  int qty = 1;
  String item = "Breakfast";

  int totalPrice = 0;

  void calculate() {
    int price = 0;

    if (item == "Breakfast") price = bPrice;
    if (item == "Lunch") price = lPrice;
    if (item == "Dinner") price = dPrice;

    setState(() {
      totalPrice = price * qty;
    });
  }

  void placeOrder() {
    setState(() {
      if (item == "Breakfast" && breakfast >= qty) {
        breakfast -= qty;
      } else if (item == "Lunch" && lunch >= qty) {
        lunch -= qty;
      } else if (item == "Dinner" && dinner >= qty) {
        dinner -= qty;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            // Item Dropdown
            DropdownButton<String>(
              value: item,
              items: ["Breakfast", "Lunch", "Dinner"].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  item = value!;
                });
              },
            ),

            // Quantity Dropdown
            DropdownButton<int>(
              value: qty,
              items: [1,2,3,4,5].map((e) {
                return DropdownMenuItem(value: e, child: Text("$e"));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  qty = value!;
                });
                calculate();
              },
            ),

            SizedBox(height: 10),

            // Total Price
            Text("Total Price: $totalPrice"),

            SizedBox(height: 10),

            // Button
            ElevatedButton(
              onPressed: placeOrder,
              child: Text("Place Order"),
            ),

            SizedBox(height: 20),

            // Remaining Stock
            Text("Breakfast Left: $breakfast"),
            Text("Lunch Left: $lunch"),
            Text("Dinner Left: $dinner"),
          ],
        ),
      ),
    );
  }
}