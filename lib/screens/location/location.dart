import 'package:contruction0/screens/location/current_location.dart';
import 'package:contruction0/screens/location/simple-location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "Track Location.. ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(const SimpleLocation());
                },
                child: const Text("Simple Location")),
            ElevatedButton(
                onPressed: () {
                  Get.to(const CurrentLocation());
                },
                child: const Text("Current Location")),
          ]),
        ),
      ),
    );
  }
}
