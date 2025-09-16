import 'package:get/get.dart';
import 'package:flutter/material.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  final List<Widget> pages = [
    Center(child: Text("home")),
    Center(child: Text("dashboard")),
    Center(child: Text("alerts")),
    //TestPushScreen(imageUrl: '', name: '',),
   // Center(child: Text("Profile")),
    Center(child: Text("settings")),

  ];

  Widget get currentPage => pages[selectedIndex.value];
}
