import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  String? tempUrl;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
      saveToStorage();
    }
  }

  saveToStorage() async {
    var name = image!.path.split('/').last;

    var response = await storage
        .ref()
        .child('products')
        .child(name)
        .putFile(File(image!.path));

    tempUrl = await response.ref.getDownloadURL();
  }

  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: firestore.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data?.docs == null) {
                return Text("empty");
              }
              return Column(
                children: snapshot.data!.docs
                    .map((e) => ListTile(
                          leading: e['image'] == null
                              ? SizedBox()
                              : Image.network(e['image']),
                          title: Text(
                            e['productName'],
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          const Text("Name of product"),
          TextFormField(
            controller: nameController,
          ),
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
                ),
          ElevatedButton(
              onPressed: () async {
                var data = {
                  "productName": nameController.text,
                  "image": tempUrl
                };
                await firestore.collection('products').doc().set(data);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
