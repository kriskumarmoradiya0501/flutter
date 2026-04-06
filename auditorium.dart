import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeatApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeatApp extends StatefulWidget {
  @override
  _SeatAppState createState() => _SeatAppState();
}

class _SeatAppState extends State<SeatApp> {

  List<String> seats = [
    "A1","A2","A3","A4","A5",
    "B1","B2","B3","B4","B5",
    "C1","C2","C3","C4","C5"
  ];

  List<bool> selected = List.filled(15, false);
  List<bool> booked = List.filled(15, false);

  int bookedCount = 0;
  int totalEarning = 0;

  int getPrice(String seat) {
    if (seat.startsWith("A")) return 800;
    if (seat.startsWith("B")) return 600;
    return 500;
  }

  void bookSeats() {
    setState(() {
      for (int i = 0; i < seats.length; i++) {
        if (selected[i] && !booked[i]) {
          booked[i] = true;
          bookedCount++;
          totalEarning += getPrice(seats[i]);
        }
      }
      selected = List.filled(15, false);
    });
  }

  void releaseSeats() {
    setState(() {
      for (int i = 0; i < seats.length; i++) {
        if (selected[i] && booked[i]) {
          booked[i] = false;
          bookedCount--;
          totalEarning -= getPrice(seats[i]);
        }
      }
      selected = List.filled(15, false);
    });
  }

  Color getColor(int i) {
    if (selected[i] && booked[i]) return Colors.yellow; // booked + selected
    if (booked[i]) return Colors.red;
    if (selected[i]) return Colors.grey;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seat Booking")),

      body: Column(
        children: [

          // Seats Grid
          Expanded(
            child: GridView.builder(
              itemCount: seats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected[index] = !selected[index];
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: getColor(index),
                    child: Center(child: Text(seats[index])),
                  ),
                );
              },
            ),
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: bookSeats, child: Text("Book")),
              ElevatedButton(onPressed: releaseSeats, child: Text("Release")),
            ],
          ),

          SizedBox(height: 10),

          // Info
          Text("Booked: $bookedCount"),
          Text("Available: ${15 - bookedCount}"),
          Text("Earning: $totalEarning"),
        ],
      ),
    );
  }
}