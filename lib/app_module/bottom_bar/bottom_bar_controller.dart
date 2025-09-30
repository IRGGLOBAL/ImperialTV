import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:imperialtv/utils/Images/my_images.dart';
import '../../utils/custom_widget/my_color.dart';
import '../home/home_content_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../search_screen/search_screen.dart';
import '../settings/settings_view.dart';
import '../settings/stream_and_download_view.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var previousIndex = 0.obs;
  var isAnimating = false.obs;

  final List<Map<String, dynamic>> navItems = [
    {
      'page': HomeContentView(),
      'label': 'Home',
      'icon':"assets/icons/home.svg",
      'active_icon': "assets/icons/home.svg",
    },
    {
      'page': SearchScreen(),
      'label': 'Activities',
      'icon': 'assets/icons/search.svg',
      'active_icon': 'assets/icons/search.svg',
    },
    {
      'page': StreamAndDownloadView(),
      'label': 'My Downloads',
      'icon': 'assets/icons/download.svg',
      'active_icon': 'assets/icons/download.svg',
    },
    {
      'page': SettingsView(),
      'label': 'More',
      'icon': 'assets/icons/more.svg',
      'active_icon': 'assets/icons/more.svg',
    },
  ];

  void changeIndex(int index) {
    if (index == selectedIndex.value || isAnimating.value) return;

    previousIndex.value = selectedIndex.value;
    isAnimating.value = true;

    Future.delayed(Duration(milliseconds: 150), () {
      selectedIndex.value = index;
      isAnimating.value = false;
    });
  }

  Widget get currentPage => navItems[selectedIndex.value]['page'];

  String getCurrentLabel(int index) => navItems[index]['label'];

  String getCurrentIcon(int index) => navItems[index]['icon'];

  String? getActiveIcon(int index) => navItems[index]['active_icon'];

  Color getColor(int index, BuildContext context) {
    if (index == selectedIndex.value) {
      return  MyColor.buttontextlightblue;
    } else if (index == previousIndex.value && isAnimating.value) {
      return  MyColor.colorWhite;
    } else {
      return Colors.grey;
    }
  }
}
