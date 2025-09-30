import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/text_strings.dart';

class EmailUsView extends StatelessWidget {
  EmailUsView({Key? key}) : super(key: key);

  final TextEditingController issueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController issuedetailController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.colorBlack,
        centerTitle: true,
        title: AppText(
          text: MyStrings.emailus.tr,
          size: AppDimensions.FONT_SIZE_18,
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

              AppText(
                text: MyStrings.thefollowinginformationwillbeincluded.tr,
                size: AppDimensions.FONT_SIZE_12,
                fontWeight: FontWeight.w600,
                color: MyColor.colorWhite,
              ),

              const SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.name.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: const [AutofillHints.email],
                      radius: 10,
                      fillColor: MyColor.lineColor,
                      hintText: "Sana",
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor,fontSize: AppDimensions.FONT_SIZE_12,),
                      controller: nameController,
                      // supply focusNode/controller from your GetX controller if needed:
                      // focusNode: controller.passwordFocusNode,
                      isPassword: false,
                      isShowSuffixIcon: false,
                      textInputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => null,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// emailaddress

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.emailaddress.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: const [AutofillHints.email],
                      radius: 10,
                      fillColor: MyColor.lineColor,
                      hintText: "abc@gmail.com",
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor,fontSize: AppDimensions.FONT_SIZE_12,),
                      controller: emailController,
                      // supply focusNode/controller from your GetX controller if needed:
                      // focusNode: controller.passwordFocusNode,
                      isPassword: false,
                      isShowSuffixIcon: false,
                      textInputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => null,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.pleaseselectyourissue.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: const [AutofillHints.email],
                      radius: 10,
                      fillColor: MyColor.lineColor,
                      hintText: MyStrings.otherissue.tr,
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor,fontSize: AppDimensions.FONT_SIZE_12,),
                      controller: issueController,
                      // supply focusNode/controller from your GetX controller if needed:
                      // focusNode: controller.passwordFocusNode,
                      isPassword: false,
                      isShowSuffixIcon: false,
                      textInputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => null,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: MyStrings.tellusalittlemoreaboutyourissue.tr,
                      size: AppDimensions.FONT_SIZE_12,
                      fontWeight: FontWeight.w700,
                      color: MyColor.primaryColor,
                    ),
                    SizedBox(height: 5,),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: const [AutofillHints.email],
                      radius: 10,
                      fillColor: MyColor.lineColor,
                      hintText: MyStrings.required.tr,
                      maxLines: 8,
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor,fontSize: AppDimensions.FONT_SIZE_12,),
                      controller: issuedetailController,
                      // supply focusNode/controller from your GetX controller if needed:
                      // focusNode: controller.passwordFocusNode,
                      isPassword: false,
                      isShowSuffixIcon: false,
                      textInputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) => null,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              const Divider(color: Colors.white70, thickness: 2),

              const SizedBox(height: 18),

              //  button
              AppButton(
                buttonName: MyStrings.sendemail.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  final issue = issueController.text.trim();
                },
                elevation: 0,
                borderWidth: 1,
                //borderColor: Colors.white,
                isCenter: true,
                buttonRadius: BorderRadius.circular(30),
              ),

              const SizedBox(height: 16),

              // Instructional text
              Text(
                MyStrings.inordertobetterassistyou.tr,
                style: TextStyle(
                  color: MyColor.colorWhite.withOpacity(0.7),
                  fontSize: 12,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),


    );
  }
}




