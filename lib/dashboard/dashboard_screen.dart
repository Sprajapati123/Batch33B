import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Softwarica college"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: ListView(
        children: [

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sale.png"),
                  ),
                  height: 150,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.yellow,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("31"),

                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text("Posts"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("15.k"),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text("Followers"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("10k"),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Following"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}