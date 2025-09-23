import 'package:flutter/material.dart';
import '../bottom_bar/bottom_bar_controller.dart';
import '../bottom_bar/bottom_bar_view.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the controller once and ensure it's available
    final BottomNavController controller = Get.put(BottomNavController());
    
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for streaming app
      extendBody: true,
      body: Obx(() => controller.currentPage), // Changes when a bottom tab is selected
      bottomNavigationBar: CustomBottomBar(), // Navigation bar
    );
  }
}

