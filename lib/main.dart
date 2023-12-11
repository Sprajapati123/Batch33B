import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_3/navigation/navigation_screen.dart';
import 'package:week_3/routes/route_generator.dart';
import 'package:week_3/splash/splash_screen.dart';
import 'package:week_3/tabbar/tabbar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              color: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black))),
      initialRoute: TabBarScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Demo Screen"), actions: [Icon(Icons.add)]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                    ),
                    Positioned(
                      top: 50,
                      height: 100,
                      right: 50,
                      left: 50,
                      child: Card(
                        child: ListTile(title: Text("stack overview")),
                      ),
                    )
                  ],
                ),
              ),
              const Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sale.png"),
                  ),
                  title: Text("Softwarica college of IT & Ecommerce"),
                  subtitle: Text("Hello, sec B"),
                  trailing: Icon(Icons.check_circle),
                ),
              ),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(15))),
                child: Row(
                  children: [
                    Text("Flutter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white)),
                    Icon(
                      Icons.add_chart_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
              Image.asset("assets/images/sale.png"),
            ],
          ),
        ));
  }
}
