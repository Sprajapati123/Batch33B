import 'package:flutter/material.dart';
import 'package:week_3/registration/registration_screen.dart';
import 'package:week_3/widgets/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          CommonTextField(
            obscureText: false,
            // suffixIcon: const Icon(Icons.password),
            label: const Text("email"),
            prefixIcon: Icon(Icons.mail),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: visibility,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                    icon: visibility == true
                        ? const Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    }),
                label: const Text("Password"),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),

          // OutlinedButton(onPressed: (){}, child: Text("Register now")),
          Container(
            width: 500,
            child: ElevatedButton(onPressed: () {}, child: Text("Login")),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
                // Navigator.pushReplacementNamed(context, routeName)
              }, child: Text("Register now"))),
          // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
          // IconButton
          //  TextButton
          // InkWell
          //GestureDetector
        ],
      ),
    );
  }
}
