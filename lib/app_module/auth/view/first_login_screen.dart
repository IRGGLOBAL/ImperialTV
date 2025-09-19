import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/style.dart';
import '../../home/home_view.dart';
import '../controller/auth_controller.dart';
import 'forget_password_screen.dart';

class FirstLoginScreen extends StatelessWidget {
  const FirstLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Optional top mini profile (as in mock)
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children:  [
                    CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.black)),
                    SizedBox(height: 4),
                    AppText(
                      text: 'Burair',
                      style: semiBoldMediumLarge.copyWith(
                          color: MyColor.colorWhite,
                          fontSize: Dimensions.fontSmall,
                          //fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              SvgPicture.asset(MyImages.appLogo, height: 60, width: 60),
              const SizedBox(height: 12),
              AppText(
                text:  MyStrings.logintitle.tr,
                style: semiBoldMediumLarge.copyWith(
                  color: MyColor.colorWhite.withOpacity(0.9),
                  fontSize: Dimensions.fontLarge +1,
                    height: 1.5,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center
              ),


              const SizedBox(height: 26),
              // Username
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 10,
                fillColor: MyColor.colorWhite,
                hintText: MyStrings.username.tr,
                hintTextStyle: TextStyle(color: MyColor.hintTextColor),
                controller: controller.emailController,
                focusNode: controller.passwordFocusNode,
                isPassword: false,
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
              // Password
              CustomTextField(
                animatedLabel: false,
                needOutlineBorder: true,
                autofillHints: [AutofillHints.email],
                radius: 10,
                fillColor: MyColor.colorWhite,
                hintText: MyStrings.passwordpassword.tr,
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


              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (_) {},
                        side: const BorderSide(color: Colors.white),
                        checkColor: Colors.black,
                        activeColor: Colors.white,
                      ),
                      AppText(
                        text: MyStrings.keepmesignedin.tr,
                        style: semiBoldMediumLarge.copyWith(
                          color: MyColor.colorWhite,
                          fontSize: Dimensions.fontMedium,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => ForgetPasswordScreen()),
                    child: AppText(
                      text: MyStrings.forgotpassword.tr,
                      style: semiBoldMediumLarge.copyWith(
                        color: MyColor.colorWhite,
                        fontSize: Dimensions.fontMedium,
                          decoration: TextDecoration.underline,
                        decorationColor: MyColor.colorWhite,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Login button (red pill)
              AppButton(
                buttonName: MyStrings.login.tr,
                buttonColor: MyColor.secondaryColor,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontLarge,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                elevation: 0,
                borderWidth: 0,
                isCenter: true,
                buttonRadius: BorderRadius.circular(8),
              ),

              const SizedBox(height: 28),
              AppText(
                text: MyStrings.donthaveanaccount.tr,
                style: semiBoldMediumLarge.copyWith(
                  color: MyColor.colorWhite.withOpacity(0.6),
                  fontSize: Dimensions.fontMedium,
                  fontWeight: FontWeight.w500
                ),
              ),
              //Text("Don’t have an account?", style: TextStyle(color: Colors.white.withOpacity(0.6))),
              const SizedBox(height: 12),
              AppButton(
                buttonName: MyStrings.signupnow.tr,
                buttonColor: MyColor.transparentColor,
                borderColor: MyColor.colorWhite,
               // buttonRadius: BorderRadius.all(10),
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontLarge,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                elevation: 0,
                borderWidth: 0,
                isCenter: true,
                buttonRadius: BorderRadius.circular(8),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}