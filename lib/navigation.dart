import 'package:contruction0/screens/others/home.dart';
import 'package:contruction0/screens/others/order_details.dart';
import 'package:contruction0/screens/others/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/bottom_navigation_controller.dart';

// ignore: must_be_immutable
class Navigation extends StatelessWidget {
  Navigation({super.key});

  BottomNavigationController bottomNavigationContoller =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: IndexedStack(
            index: bottomNavigationContoller.selectedIndex.value,
            children: const [
              HomeScreen(),
              OrderDetails(),
              Profile(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            showSelectedLabels: false,
            currentIndex: bottomNavigationContoller.selectedIndex.value,
            onTap: bottomNavigationContoller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Order",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.white,
              ),
            ]),
      ),
    );
  }
}
