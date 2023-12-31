import 'package:flutter/material.dart';
import 'package:week_3/dashboard/components/header_text.dart';

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
        // padding: EdgeInsets.only(top: 20),
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sale.png"),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HeaderText(label: "Posts", count: ""),
                          HeaderText(
                            label: "Followers",
                            count: "15.5k",
                          ),
                          HeaderText(
                            label: "Following",
                            count: "15.5k",
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                              flex: 3,
                              child: OutlinedButton(
                                  onPressed: null, child: Text("Message"))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                  onPressed: null,
                                  child: Icon(Icons.person_add_alt_outlined))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                  onPressed: null,
                                  child: Icon(Icons.arrow_drop_down))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text("Softwarica college",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Text("Private"),
                Text("Institution"),
                Text("Sofwarica college of IT and Ecommerce"),
              ],
            ),
          ),

          ///List<int> a = [1,2,3]
          ///List<int> b = [1,2,3]
          ///List<int> c = [...a,...b]
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ///if(index == 0){
                ///true
                ///}else{
                ///false
                ///}
                /// index == 0 ? true : false;
                ...List.generate(
                  20,
                  (index) => Padding(
                    padding:
                        EdgeInsets.only(left: index == 0 ? 10 : 0, right: 15.0),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/sale.png"),
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 10,
              children: List.generate(
                  50, (index) => Image.asset("assets/images/sale.png")),
            ),
          ),

        ],
      ),
    );
  }
}
