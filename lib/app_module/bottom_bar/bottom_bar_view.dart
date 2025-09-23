import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_bar_controller.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatelessWidget {
  final BottomNavController controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(controller.navItems.length, (index) {
          return Obx(() {
            final isSelected = index == controller.selectedIndex.value;
            final isPrevious = index == controller.previousIndex.value &&
                controller.isAnimating.value;
            final activeColor = controller.getColor(index, context);

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => controller.changeIndex(index),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SVG Icon with color filtering
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: isSelected ? 24 : 22,
                      width: isSelected ? 24 : 22,
                      child: SvgPicture.asset(
                        controller.getActiveIcon(index) ?? controller.getCurrentIcon(index),
                        colorFilter: ColorFilter.mode(
                          activeColor,
                          BlendMode.srcIn,
                        ),
                        height: isSelected ? 24 : 22,
                        width: isSelected ? 24 : 22,
                      ),
                    ),
                    SizedBox(height: 4),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 150),
                      opacity: isSelected ? 1.0 : 0.8,
                      child: Text(
                        controller.getCurrentLabel(index),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: activeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}
// class CustomBottomBar extends StatelessWidget {
//   final List<String> iconPaths = [
//     MyImages.homeIcon,
//     MyImages.searchIcon,
//     MyImages.bookIcon,
//     MyImages.moreIcon,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomNavController>(
//       builder: (controller) => Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(5),
//             topRight: Radius.circular(5),
//           ),
//           border: Border.all(color: MyColor.primaryColor.withValues(alpha: 0.1), width: 1),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(iconPaths.length, (index) {
//             final isSelected = controller.selectedIndex.value == index;
//             return GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onTap: () {
//                 controller.changeIndex(index);
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   //  Icon
//                   SvgPicture.asset(
//                     iconPaths[index],
//                     height: 16,
//                     width: 16,
//                     colorFilter: ColorFilter.mode(
//                       isSelected ? Colors.red : Colors.grey,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   //  text
//
//                     Container(
//                       height: 12,
//                       //width: 30,
//                       decoration: const BoxDecoration(
//                         //color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                       child: AppText(
//                         text: "Movie",
//                         //color: Colors.red,
//                         size: Dimensions.fontExtraSmall,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     )
//              // keeps alignment equal
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }


