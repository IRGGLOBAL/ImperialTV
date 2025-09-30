import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imperialtv/utils/text_strings.dart';

import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/Widgets/custom_text_field.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/custom_widget/style.dart';
import 'manage_account_view.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

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
          text: MyStrings.changepassword.tr,
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
              // first name
              AppText(
                text: MyStrings.oldpassword.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.colorWhite,
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                hintText: 'Sana',
                autofillHints: [AutofillHints.email],
                radius: 10,
                fillColor: MyColor.colorWhite,
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                //controller: controller.passwordController,
                // focusNode: controller.passwordFocusNode,
                isPassword: true,
                isShowSuffixIcon: true,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return MyStrings.emailvalidationtext.tr;
                  }

                  return null;
                },
                onChanged: (value) {
                  return;
                },
              ),

              const SizedBox(height: 16),
              AppText(
                text: MyStrings.newpassword.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.colorWhite,
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                hintText: '+1 (646) 555 5584',
                autofillHints: [AutofillHints.email],
                radius: 10,
                fillColor: MyColor.colorWhite,
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                //controller: controller.passwordController,
               // focusNode: controller.passwordFocusNode,
                isPassword: true,
                isShowSuffixIcon: true,
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return null;
                  }

                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.trim())) {
                    return MyStrings.emailvalidationtext.tr;
                  }

                  return null;
                },
                onChanged: (value) {
                  return;
                },
              ),
              const SizedBox(height: 5),

              AppText(
                text: MyStrings.pleaseenterapasswordyou.tr,
                style: mediumOverLarge.copyWith(
                  color: MyColor.colorWhite.withOpacity(0.7),
                  fontSize: Dimensions.fontSmall,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.4), // Adjust height as needed

              AppButton(
                buttonName: MyStrings.save.tr,
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

            ],
          ),
        ),
      ),
    );
  }


}


