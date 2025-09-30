import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imperialtv/app_module/settings/registered_devices.dart';
import 'package:imperialtv/app_module/settings/subscription_view.dart';
import 'package:imperialtv/utils/text_strings.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';
import 'change_languages_view.dart';
import 'edit_profile_view.dart';
import 'favourite_view.dart';
import 'help/help_view.dart';
import 'manage_profile_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

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
          text: MyStrings.profile.tr,
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

              /// Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: MyStrings.name.tr,
                        size: AppDimensions.FONT_SIZE_18,
                        fontWeight: FontWeight.bold,
                        color:MyColor.colorWhite,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=> EditProfileView());
                        },
                        child: AppText(
                          text: MyStrings.editprofile.tr,
                          size: AppDimensions.FONT_SIZE_14,
                          fontWeight: FontWeight.w500,
                          color: MyColor.colorWhite.withOpacity(0.6),
                          underLine: TextDecoration.underline,
                          decorationColor: MyColor.colorWhite.withOpacity(0.6),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Premium Membership Card
              GestureDetector(
                onTap: (){
                  Get.to(()=> SubscriptionView());
                },
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient:  LinearGradient(
                      colors: [Color(0xFF6A11CB), MyColor.buttontextlightblue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      AppText(
                        text: MyStrings.premiummembership.tr,
                        size: AppDimensions.FONT_SIZE_16,
                        fontWeight: FontWeight.bold,
                        color:MyColor.colorWhite,
                      ),
                      SizedBox(height: 4),
                      AppText(
                        text: MyStrings.upgradeformorefeatures.tr,
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.bold,
                        color:MyColor.colorWhite.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              /// Account Section
              AppText(
                text: MyStrings.accountmit.tr,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w600,
                color:MyColor.colorWhite,
              ),

              const SizedBox(height: 16),
              _buildListTile(
                svgPath: MyImages.profileIcon,
                title: MyStrings.manageprofile.tr,
                onTap: () {
                  Get.to(()=> ManageProfileView());
                },
              ),
              _buildListTile(
                svgPath: MyImages.languageIcon,
                title: MyStrings.languages.tr,
                onTap: () {
                  Get.to(()=> ChangeLanguagesView());
                },
              ),
              _buildListTile(
                svgPath: MyImages.devicesIcon,
                title: MyStrings.registereddevices.tr,
                onTap: () {
                  Get.to(()=> RegisteredDevices());
                },
              ),
              _buildListTile(
                svgPath: MyImages.starIcon,
                title: MyStrings.rateandreview.tr,
                onTap: () {

                },
              ),

              _buildListTile(
                svgPath: MyImages.helpIcon,
                title: MyStrings.favourites.tr,
                onTap: () {
                  Get.to(()=> FavouriteView());
                },
              ),
              _buildListTile(
                svgPath: MyImages.helpIcon,
                title: MyStrings.help.tr,
                onTap: () {
                  Get.to(()=> HelpView());
                },
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
    required VoidCallback onTap, // Add this required parameter
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
}


