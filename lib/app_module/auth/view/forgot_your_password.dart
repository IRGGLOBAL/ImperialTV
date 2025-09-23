import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Routes/Routes.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/willpopwidget.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/round_button.dart';
import '../../../utils/custom_widget/style.dart';
import '../../../utils/text_strings.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class ForgotYourPassword extends StatelessWidget {
  const ForgotYourPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: WillPopWidget(
        child: Scaffold(
          backgroundColor: MyColor.colorWhite,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                child: Stack(
                  children: [
                    // Background SVG
                    SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: SvgPicture.asset(
                        MyImages.verificationbackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(
                              text: MyStrings.forgotyourpassword.tr,
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.colorWhite,
                                  fontSize: Dimensions.fontOverLarge2 + 8,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.start
                          ),
                          SizedBox(height: 8),
                          AppText(
                              text: MyStrings.donntworryithappensenteryouremail.tr,
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.colorWhite,
                                  fontSize: Dimensions.fontDefault,
                                  fontWeight: FontWeight.w400
                              ),
                              textAlign: TextAlign.start
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded( // Added Expanded here
                child: GetBuilder<AuthController>(
                  builder: (controller) => controller.isLoadings && false
                      ? Center(
                      child: CircularProgressIndicator(
                          color: MyColor.getPrimaryColor()
                      )
                  )
                      : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: Dimensions.screenPaddingHV,
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          top: Dimensions.space20,
                          bottom: Dimensions.space20
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          AppText(
                            text: MyStrings.phonenumber.tr,
                            style: mediumOverLarge.copyWith(
                              color: MyColor.colorBlack.withOpacity(0.5),
                              fontSize: Dimensions.fontSmall,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 6),

                          CustomTextField(
                            animatedLabel: false,
                            needOutlineBorder: true,
                            autofillHints: [AutofillHints.email],
                            radius: 15,
                            fillColor: MyColor.colorWhite,
                            hintText: '+1 (646) 555 5584',
                            hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                            controller: controller.passwordController,
                            focusNode: controller.passwordFocusNode,
                            isPassword: false,
                            isShowSuffixIcon: true,
                            textInputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,

                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return null;
                              }

                              // If not empty, check if it's a valid email
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

                          const SizedBox(height: Dimensions.space100),
                          AppButton(
                            buttonName: MyStrings.continues.tr,
                            buttonColor: MyColor.secondaryColor,
                            textColor: MyColor.colorWhite,
                            textSize: Dimensions.fontedium,
                            fontWeight: FontWeight.w600,
                            hasShadow: false,
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            onTap: () {

                              Get.to(()=>SmsVerificationScreen());

                              },
                            elevation: 0,
                            borderWidth: 1,
                            borderColor: Colors.white,
                            isCenter: true,
                            buttonRadius: BorderRadius.circular(30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}