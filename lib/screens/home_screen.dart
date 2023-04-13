// ignore_for_file: use_key_in_widget_constructors

import 'package:darzee_assi/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_controllers/home_screen_get_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  HomeScreenGetController homeScreenGetController = Get.put(
    HomeScreenGetController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: homeScreenGetController.myIndex.value,
            children: const [
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
                    fontSize: 30,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              )),
              ProfileScreen(),
            ],
          );
        }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                onTap: homeScreenGetController.changeTabIndex,
                currentIndex: homeScreenGetController.myIndex.value,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                showSelectedLabels: true,
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
                ])));
  }
}
