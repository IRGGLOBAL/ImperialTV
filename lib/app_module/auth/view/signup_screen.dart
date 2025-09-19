import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/style.dart';
import '../controller/auth_controller.dart';
import 'enable_face_id.dart';
import 'first_login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Center(
                child: SvgPicture.asset(
                  MyImages.appLogo,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    AppText(
                      text: MyStrings.signupnow.tr,
                      style: mediumOverLarge.copyWith(
                        color: MyColor.primaryColor,
                        fontSize: Dimensions.fontOverLarge,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(height: 6),
                    AppText(
                      text: MyStrings.beginyourjourneytoday.tr,
                      style: mediumOverLarge.copyWith(
                        color: MyColor.colorBlack.withOpacity(0.5),
                        fontSize: Dimensions.fontDefault,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Email
                    AppText(
                      text: MyStrings.email.tr,
                      style: mediumOverLarge.copyWith(
                        color: MyColor.colorBlack.withOpacity(0.5),
                        fontSize: Dimensions.fontSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 6),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      autofillHints: [AutofillHints.email],
                      fillColor: MyColor.colorWhite,
                      hintText: 'burair1212@imperial.com',
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                      nextFocus: controller.passwordFocusNode,
                      textInputType: TextInputType.emailAddress,
                      radius: 15,
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
                      text: MyStrings.phonenumber.tr,
                      style: mediumOverLarge.copyWith(
                        color: MyColor.colorBlack.withOpacity(0.5),
                        fontSize: Dimensions.fontSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
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


                    const SizedBox(height: 16),

                    AppText(
                      text: MyStrings.enterpassword.tr,
                      style: mediumOverLarge.copyWith(
                        color: MyColor.colorBlack.withOpacity(0.5),
                        fontSize: Dimensions.fontSmall,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 6),
                    CustomTextField(
                      animatedLabel: false,
                      enableInteractiveSelection: true,
                      needOutlineBorder: true,
                      autofillHints: [AutofillHints.email],
                      radius: 15,
                      fillColor: MyColor.colorWhite,
                     // hintText: MyStrings.passwordhinttext.tr,
                      hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocusNode,
                      isPassword: true,
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
                    const SizedBox(height: 14),
                    Row(
                      children: [

                        Checkbox(
                          value: agreed,
                          onChanged: (v) => setState(() => agreed = v ?? false),
                          side: BorderSide(color: Colors.grey.shade400),
                        ),
                        AppText(
                          text: MyStrings.agreeto.tr,
                          style: mediumOverLarge.copyWith(
                            color: MyColor.colorBlack.withOpacity(0.5),
                            fontSize: Dimensions.fontMedium,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Get.to(()=> FirstLoginScreen());
                          },
                          child:
                          AppText(
                            text: MyStrings.termsandconditions.tr,
                            style: mediumOverLarge.copyWith(
                              color: MyColor.secondaryColor,
                              fontSize: Dimensions.fontMedium,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ],
                    ),

                    const SizedBox(height: 6),
                    // Sign Up button (red pill)
                    AppButton(
                      buttonName: MyStrings.signup.tr,
                      buttonColor: MyColor.secondaryColor,
                      textColor: MyColor.colorWhite,
                      textSize: Dimensions.fontedium,
                      fontWeight: FontWeight.w600,
                      hasShadow: false,
                      buttonWidth: double.infinity,
                      buttonHeight: 50,
                      onTap: () {
                        Get.to(()=> EnableFaceId());
                        // if (agreed) {
                        //   Get.to(() => const SmsVerificationScreen());
                        // }
                      },
                      elevation: 0,
                      borderWidth: 1,
                      borderColor: Colors.white,
                      isCenter: true,
                      buttonRadius: BorderRadius.circular(30), // Stadium shape
                    ),

                    const SizedBox(height: 12),
                    // Google button
                    InkWell(
                      onTap: () => controller.continueWithGoogle(),
                            child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                              decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            SvgPicture.asset(MyImages.googleicon, height: 20, width: 20),
                             SizedBox(width: 10),
                                AppText(
                                  text: MyStrings.signupwithgoogle.tr,
                                  style: mediumOverLarge.copyWith(
                                    color: MyColor.primaryColor,
                                    fontSize: Dimensions.fontMedium,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              ),

              const SizedBox(height: 16),

                  ],
                ),
              ),
            ),
    );
  }

}
