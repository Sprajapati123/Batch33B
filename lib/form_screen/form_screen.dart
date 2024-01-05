import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  static const String routeName = "/form";

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emaileditController = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: database.ref('users').onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.data!.snapshot.value == null) {
                  return Text("no data");
                }

                Map<dynamic, dynamic> allData =
                    snapshot.data!.snapshot.value as dynamic;
                List<dynamic> values = allData.values.toList();
                List<dynamic> key = allData.keys.toList();

                return Column(
                  children: [
                    ...List.generate(
                        values.length,
                        (index) => ListTile(
                              title: Text(values[index]['email']),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        emaileditController.text =
                                            values[index]['email'];
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Edit data"),
                                            content: Container(
                                              height: 400,
                                              child: Column(
                                                children: [
                                                  Text("Email"),
                                                  TextFormField(
                                                    controller:
                                                        emaileditController,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        var datas = {
                                                          "email":
                                                              emaileditController
                                                                  .text
                                                        };

                                                        database
                                                            .ref()
                                                            .child('users')
                                                            .child(key[index])
                                                            .update(datas);
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Update")),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () async {
                                        await database
                                            .ref('users')
                                            .child(key[index])
                                            .remove();
                                      }),
                                ],
                              ),
                            ))
                  ],
                );
              },
            ),
            Text("First name"),
            TextFormField(
              controller: fnameController,
            ),
            Text("last name"),
            TextFormField(controller: lnameController),
            Text("Contact"),
            TextFormField(controller: contactController),
            Text("Email"),
            TextFormField(controller: emailController),
            ElevatedButton(
                onPressed: () async {
                  var data = {
                    "email": emailController.text,
                    "firstName": fnameController.text,
                    "lastName": lnameController.text,
                    "Contact": contactController.text,
                  };
                  await database
                      .ref()
                      .child("users")
                      .push()
                      .set(data)
                      .then((value) {
                    //show success message to user
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Submitted")));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                    //show error message to user
                  });
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
