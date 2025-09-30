import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imperialtv/app_module/settings/permissions_and_notifications.dart';
import 'package:imperialtv/app_module/settings/stream_and_download_view.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import 'manage_account_view.dart';


class ManageProfileView extends StatelessWidget {
   ManageProfileView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.manageprofile.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color:MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite,),
          onPressed: () {
            Get.back();
          },
        ),

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),
              _buildListTile(
                svgPath: MyImages.profileIcon,
                title: MyStrings.manageaccount.tr,
                onTap: () {
                  Get.to(()=> ManageAccountView());
                },
              ),
              _buildListTile(
                svgPath: MyImages.languageIcon,
                title: MyStrings.permissionsandnotifications.tr,
                onTap: () {
                  Get.to(()=> PermissionsAndNotifications());
                },
              ),
              _buildListTile(
                svgPath: MyImages.devicesIcon,
                title: MyStrings.streamanddownload.tr,
                onTap: () {
                  Get.to(()=>StreamAndDownloadView());

                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.4), // Adjust height as needed

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
                  //Get.to(()=> ScanFaceView());

                },
                elevation: 0,
                borderWidth: 1,
                borderColor: MyColor.secondaryColor,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30),
              ),
              SizedBox(height: 10,),
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

  Widget _buildListTile({
    required String svgPath,
    required String title,
    required VoidCallback onTap,
    double? width = 24,
    double? height = 24,
    Color? color = Colors.white,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            svgPath,
            width: width,
            height: height,
            color: color,
          ),
          title: AppText(
            text: title,
            size: AppDimensions.FONT_SIZE_16,
            fontWeight: FontWeight.w500,
            color: MyColor.colorWhite,
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.white70, size: 16),
          onTap: onTap,
        ),
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


