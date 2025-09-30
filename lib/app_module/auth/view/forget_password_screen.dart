import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/Images/my_images.dart';
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
import 'package:flutter_svg/flutter_svg.dart';


class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
   final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: MyColor.colorWhite,
        body:  Form(
          key: _formKey,
          child: Column(
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
                    Positioned(
                      top:  40,
                      child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
                      onPressed: () {
                        Get.back();
                      },
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
                              text: MyStrings.forgotpassword.tr,
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.colorWhite,
                                  fontSize: Dimensions.fontOverLarge2 + 8,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.start
                          ),
                          SizedBox(height: 8),
                          AppText(
                              text: MyStrings.noworriestJustenteryour.tr,
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
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.primaryColor,
                                  fontSize: Dimensions.fontDefault,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.start
                          ),
                          const SizedBox(height: Dimensions.space10),
                          CustomTextField(
                            radius: 10,
                            animatedLabel: true,
                            needOutlineBorder: true,
                            hintText: "abc@gmail.com".tr,
                            textInputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            controller: controller.emailOrUsernameController,
                            onSuffixTap: () {},
                            onChanged: (value) {
                              return;
                            },
                            validator: (value) {
                              if (controller
                                  .emailOrUsernameController.text.isEmpty) {
                                return "Enter username or email".tr;
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: Dimensions.space25),
                          AppButton(
                            buttonName: MyStrings.submit.tr,
                            buttonColor: MyColor.secondaryColor,
                            textColor: MyColor.colorWhite,
                            textSize: Dimensions.fontLarge,
                            fontWeight: FontWeight.w600,
                            hasShadow: false,
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(()=>SmsVerificationScreen());
                              }
                            },
                            elevation: 0,
                            borderWidth: 0,
                            isCenter: true,
                            buttonRadius: BorderRadius.circular(30),
                          ),
                          const SizedBox(height: Dimensions.space40),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.to(() => SignUpScreen()),
                            child: Center(
                              child:   AppText(
                                text: MyStrings.signup.tr,
                                style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.colorWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontLarge,
                                  decoration: TextDecoration.underline,
                                  decorationColor: MyColor.colorWhite,
                                  decorationThickness: 0.4,),
                                textAlign: TextAlign.start,
                              ),
                            ),
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
