import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
  static const String routeName = "/tabbar";

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            bottom: TabBar(tabs: [
              Tab(text: "Active Order",),
              Tab(text: "Cancelled Order",),
              Tab(text: "Cancelled Order",),
            ]),
          ),
          body: TabBarView(
            children: [
              Container(color: Colors.red,),
              Container(color: Colors.green,),
              Container(color: Colors.pink,),
            ],
          ),
        ),

    );
  }
}
