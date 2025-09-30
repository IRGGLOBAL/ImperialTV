import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/text_strings.dart';

class PermissionsAndNotifications extends StatefulWidget {
  const PermissionsAndNotifications({Key? key}) : super(key: key);

  @override
  State<PermissionsAndNotifications> createState() =>
      _PermissionsAndNotificationsState();
}

class _PermissionsAndNotificationsState
    extends State<PermissionsAndNotifications> {
  bool allowNotifications = true;
  bool downloads = false;
  bool watchlistHistory = false;
  bool recommended = false;
  bool newFeatures = false;
  bool specialOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.notifications.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subtitle
              AppText(
                text:MyStrings.notificationstitle.tr,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w400,
                color: MyColor.colorWhite,
              ),
              const SizedBox(height: 20),

              // Allow Notifications
              _buildSwitchRow(MyStrings.allownotifications.tr, allowNotifications,
                      (val) => setState(() => allowNotifications = val)),
              // Toggles list
              _buildSwitchRow(
                  MyStrings.downloads.tr, downloads, (val) => setState(() => downloads = val)),
              _buildSwitchRow(MyStrings.yourwatchlistandhistory.tr, watchlistHistory,
                      (val) => setState(() => watchlistHistory = val)),
              _buildSwitchRow(MyStrings.recommendedforyou.tr, recommended,
                      (val) => setState(() => recommended = val)),
              _buildSwitchRow(MyStrings.newappfeatures.tr, newFeatures,
                      (val) => setState(() => newFeatures = val)),
              _buildSwitchRow(MyStrings.specialoffers.tr, specialOffers,
                      (val) => setState(() => specialOffers = val)),

              SizedBox(height: MediaQuery.of(context).size.height * 0.15),

              // Delete account button
              AppButton(
                buttonName: MyStrings.deleteaccount.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  // Delete logic
                },
                elevation: 0,
                borderWidth: 1,
                borderColor: MyColor.secondaryColor,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30),
              ),
              const SizedBox(height: 10),

              // Sign out button
              AppButton(
                buttonName: MyStrings.signout.tr,
                buttonColor: MyColor.colorWhite,
                textColor: MyColor.primaryColor,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () => _showSignOutDialog(context),
                elevation: 0,
                borderWidth: 1,
                borderColor: MyColor.colorWhite,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSwitchRow(String title, bool value, ValueChanged<bool> onChanged) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Important: prevents column from expanding
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0), // Very small padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: title,
                size: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeight.w400,
                color: MyColor.colorWhite,
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: MyColor.greenP,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.5, height: 0), // Reduced height
      ],
    );
  }

  /// Custom Sign Out Dialog
  void _showSignOutDialog(BuildContext context, ) {
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
