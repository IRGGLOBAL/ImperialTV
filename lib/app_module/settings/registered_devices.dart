import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';
import '../search_screen/search_screen.dart';

class RegisteredDevices extends StatelessWidget {
  RegisteredDevices({Key? key}) : super(key: key);

  final devices = [
    {"name": "Apple (iPad)", "date": "August 9, 2025"},
    {"name": "Samsung Galaxy S21", "date": "July 15, 2025"},
    {"name": "Windows Laptop", "date": "June 2, 2025"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: Colors.transparent,
        title: AppText(
          text: MyStrings.registereddevices.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Get.to(()=> SearchScreen());
            },
          )
        ],
      ),

      body: Container(
        padding: AppPaddings.defaultPadding,
        child: ListView.separated(
          itemCount: devices.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final device = devices[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:  MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Device Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: device["name"]!,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w600,
                        color: MyColor.primaryColor,
                      ),
                      const SizedBox(height: 6),
                      AppText(
                        text: "${MyStrings.registrationdate.tr}: ${device["date"]}",
                        size: AppDimensions.FONT_SIZE_12,
                        fontWeight: FontWeight.w400,
                        color: MyColor.primaryColor,
                      ),
                    ],
                  ),

                  // Sign out button
                  InkWell(
                    onTap: () => _showSignOutDialog(context, device["name"]!),
                    child: AppText(
                      text: "${MyStrings.signout.tr}",
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w600,
                      color: MyColor.secondaryColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Custom Sign Out Dialog
  void _showSignOutDialog(BuildContext context, String deviceName) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Dialog(
          backgroundColor: MyColor.titleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: "${MyStrings.signoutthedevice.tr}",
                  size: AppDimensions.FONT_SIZE_16,
                  fontWeight: FontWeight.w700,
                  color: MyColor.colorWhite,
                ),
                const SizedBox(height: 16),
                AppText(
                  text: "${MyStrings.areyousureyouwanttosignout.tr}",
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w400,
                  color: MyColor.colorWhite,
                ),
                const SizedBox(height: 20),

                // Sign out button
                AppButton(
                  buttonName: "${MyStrings.signout.tr}",
                  buttonColor: MyColor.secondaryColor,
                  textColor: Colors.white,
                  textSize: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w600,
                  buttonWidth: double.infinity,
                  buttonHeight: 45,
                  buttonRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.pop(ctx); // Close dialog

                    // 👉 Example: Randomly show success or failure alert
                    final isSuccess = DateTime.now().second % 2 == 0;

                    if (isSuccess) {
                      Get.snackbar(
                        MyStrings.deviceremovedsuccessfully.tr,
                        "",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP,
                        margin: const EdgeInsets.all(12),
                        borderRadius: 8,
                      );
                    } else {
                      Get.snackbar(
                        MyStrings.deviceunabletoremove.tr,
                        "",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.TOP,
                        margin: const EdgeInsets.all(12),
                        borderRadius: 8,
                      );
                    }
                  },
                ),

                const SizedBox(height: 12),

                // Cancel button
                AppButton(
                  buttonName: "${MyStrings.cancel.tr}",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  textSize: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w600,
                  buttonWidth: double.infinity,
                  buttonHeight: 45,
                  buttonRadius: BorderRadius.circular(30),
                  borderColor: Colors.grey.shade400,
                  onTap: () => Navigator.pop(ctx),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
