import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Example"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Row"),
              Tab(text: "Column"),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            // 🔹 TAB 1 → ROW
            Container(
              color: Colors.yellow, // background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/1.png", width: 100),
                  Image.asset("assets/images/2.png", width: 100),
                  Image.asset("assets/images/3.png", width: 100),
                ],
              ),
            ),

            // 🔹 TAB 2 → COLUMN
            Container(
              color: Colors.lightBlue, // background color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/1.png", height: 100),
                  Image.asset("assets/images/2.png", height: 100),
                  Image.asset("assets/images/3.png", height: 100),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}