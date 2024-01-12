import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  File? image;
  void pickImage(ImageSource source) async {
    var selected =
        await ImagePicker().pickImage(source: source, imageQuality: 100);
    if (selected == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("No image selected")));
    } else {
      setState(() {
        image = File(selected.path);
      });
    }
  }

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
                  builder: (context) => AlertDialog(
                    title: Text("Browse image"),
                    content: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.photo_camera,
                              size: 40,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.photo_outlined,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text("Browse image")),
          image == null
              ? const SizedBox()
              : Image.file(
                  image!,
                  height: 100,
                  width: 100,
                )
        ],
      ),
    );
  }
}
