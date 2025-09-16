import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownController extends GetxController {
  RxString selectedValue = 'Price'.obs;

  final List<String> items = ['Price','200\$', '400\$', '800\$'];
}

class CustomDropdown extends StatelessWidget {
  final CustomDropdownController controller = Get.put(CustomDropdownController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 40,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.selectedValue.value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color:Colors.grey.withOpacity(0.6)),
          style:  TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
          dropdownColor: Colors.white,
          items: controller.items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item, style:  TextStyle(color: Colors.grey.withOpacity(0.6))),
          ))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              controller.selectedValue.value = val;
            }
          },
        ),
      ),
    ));
  }
}
