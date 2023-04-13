// ignore_for_file: use_key_in_widget_constructors

import 'package:darzee_assi/screens/profile_screean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_controllers/home_screen_get_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  final HomeScreenGetController homeScreenGetController =
      Get.put(HomeScreenGetController());
  final List<Widget> pages = const [
    Center(
        child: Text(
      "Home",
      style: TextStyle(
        fontSize: 30,
        color: Colors.pinkAccent,
        fontWeight: FontWeight.bold,
      ),
    )),
    Center(
        child: Text(
      "Orders",
      style: TextStyle(
        fontSize: 30,
        color: Colors.purpleAccent,
        fontWeight: FontWeight.bold,
      ),
    )),
    Center(
        child: Text(
      "Dashboard",
      style: TextStyle(
          fontSize: 30, color: Colors.greenAccent, fontWeight: FontWeight.bold),
    )),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: homeScreenGetController.myIndex.value,
            children: pages,
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              homeScreenGetController.myIndex.value = index;
            },
            currentIndex: homeScreenGetController.myIndex.value,
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            unselectedLabelStyle: const TextStyle(color: Colors.green),
            selectedLabelStyle: const TextStyle(color: Colors.blue),
            selectedIconTheme: const IconThemeData(color: Colors.black),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ]));
  }
}
