import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_3/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    navigate();
    super.initState();
  }
  void navigate() async{
    await Future.delayed(const Duration(seconds: 3),(){
      // if(loggedin){
      //   navigate to dashboard
      // }else{
      //   navigate to login
      // }
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/sale.png",height: 200,width: 200,)),
            const CircularProgressIndicator(color: Colors.red),
            // CircularProgressIndicator()

          ],
        ),
      ),
    );
  }
}
