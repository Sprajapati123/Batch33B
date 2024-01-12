import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text("Browse image"),
                    content: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_camera,
                            size: 40,
                          ),
                          Icon(
                            Icons.photo_outlined,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text("Browse image"))
        ],
      ),
    );
  }
}
