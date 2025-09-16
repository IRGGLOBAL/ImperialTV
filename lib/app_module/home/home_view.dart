import 'package:flutter/material.dart';
import '../bottom_bar/bottom_bar_controller.dart';
import '../bottom_bar/bottom_bar_view.dart';
import 'package:get/get.dart';


class MyHomePage extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBody: true,
      body: Obx(() => controller.currentPage), // Changes when a bottom tab is selected
      bottomNavigationBar: CustomBottomBar(), // Navigation bar
    );
  }
}

