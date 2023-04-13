import 'package:darzee_assi/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Darzee());
}

class Darzee extends StatelessWidget {
  const Darzee({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Darzee App",
      home: HomeScreen(),
    );
  }
}
