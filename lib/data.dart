// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final currentUser = FirebaseAuth.instance.currentUser;
  //final UserController userController = Get.put(UserController());
  String name = "";
  String email = "";
  String address = "";
  String number = "";
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var var1 = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      name = var1.data()?['Name'];
      email = var1.data()?['Email'];
      address = var1.data()?['Address'];
      number = var1.data()?['Phone Number'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final userModel = userController.getDoctorById(currentUser!.uid);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.to(() => const Login());
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          " Home Screen",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body:
          //userModel == null
          //     ? const Center(child: CircularProgressIndicator())
          //     :
          SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // userModel.name.toString(),
              name,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              // "Email :${userModel.email}",
              email,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              //"Contact :${userModel.number}",
              number,
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              // "Address :${userModel.address}",
              address,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
