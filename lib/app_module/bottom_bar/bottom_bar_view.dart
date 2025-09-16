import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/custom_widget/my_color.dart';
import 'bottom_bar_controller.dart';

class CustomBottomBar extends StatelessWidget {
  final BottomNavController controller = Get.find();

  final List<String> iconPaths = [
    'assets/icons/home.svg',
    'assets/icons/search.svg',
    'assets/icons/notifications.svg',
    'assets/icons/profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconPaths.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? MyColor.buttonbackgroun : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 24, // or any consistent size like 28
                  width: 24,
                  child: SvgPicture.asset(
                    iconPaths[index],
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      isSelected ? MyColor.primaryColor : MyColor.buttonbackgroun,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
