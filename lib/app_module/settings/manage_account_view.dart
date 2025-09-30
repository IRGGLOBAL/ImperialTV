import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imperialtv/utils/text_strings.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import 'change_password.dart';
import 'manage_personal_detail.dart';

class ManageAccountView extends StatelessWidget {
  ManageAccountView({Key? key}) : super(key: key);

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
          text: MyStrings.manageaccount.tr,
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
                title: MyStrings.managepersonaldetails.tr,
                onTap: () {
                  Get.to(()=> ManagePersonalDetail());
                },
              ),
              _buildListTile(
                svgPath: MyImages.languageIcon,
                title: MyStrings.changepassword.tr,
                onTap: () {
                  Get.to(()=> ChangePassword());
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
}


