import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/round_button.dart';
import '../../../utils/custom_widget/style.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor:  MyColor.colorWhite,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20), // Extra height for curve
        child: Container(
          decoration: BoxDecoration(
            color: MyColor.colorWhite,
            border: Border(
              bottom: BorderSide(
                  color:  MyColor.borderColor.withValues(alpha: 0.9),
                  width: 1), // Top color
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent, // Important: transparent to show container color
            elevation: 0,
            title: Image.asset(MyImages.appLogopng, height: 45, width: 100),
            centerTitle: false,
          ),
        ),
      ),
      body:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.space25),
                    Text(
                      'Sign up'.tr,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:  MyColor.colorBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Dimensions.space25),
                    // Don't have an account
                    Row(
                      children: [
                        Text(
                          "Don't have an account? ".tr,
                          style: TextStyle(color:  MyColor.colorBlack,
                            fontSize: 16,),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => LoginScreen()),
                          child: Text(
                            'Sign In'.tr,
                            style: TextStyle(
                              fontSize: 16,
                              color:  MyColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.space25),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      labelText: "",
                      autofillHints: [AutofillHints.email],

                      hintText: "Email address".tr ,
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      nextFocus: controller.firstNameFocusNode,
                      textInputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        }

                        // If not empty, check if it's a valid email
                        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.trim())) {
                          return "Enter valid email".tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        return;
                      },
                    ),
                    SizedBox(height: Dimensions.space25),
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      hintText:  "First Name".tr,
                      //labelText: "Email address".tr,
                      controller: controller.firstNameController,
                      focusNode: controller.firstNameFocusNode,
                      textInputType: TextInputType.emailAddress,
                      nextFocus: controller.passwordFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email".tr;
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        return;
                      },
                    ),
                    SizedBox(height: Dimensions.space25),
                    //last name
                    CustomTextField(
                      animatedLabel: false,
                      needOutlineBorder: true,
                      labelText: "",
                      //MyStrings.lastName.tr,
                      autofillHints: [AutofillHints.nameSuffix],
                      hintText: "Last Name".tr,
                      controller: controller.lastNameController,
                      focusNode: controller.lastNameFocusNode,
                      textInputType: TextInputType.text,
                      nextFocus: controller.passwordFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter last name".tr;
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        return;
                      },
                    ),
                    SizedBox(height: Dimensions.space25),
                    //Password
                    Focus(
                        onFocusChange: (hasFocus) {
                          controller.changePasswordFocus(hasFocus);
                          controller.checkPasswordStrength = true;
                        },
                        child: CustomTextField(
                          animatedLabel: false,
                          needOutlineBorder: true,
                          isShowSuffixIcon: true,
                          isPassword: true,
                          hintText: 'Password'.tr,
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                         // nextFocus: controller.emailFocusNode,
                          textInputType: TextInputType.text,
                          onChanged: (value) {
                            controller.checkPasswordStrength = true;
                            controller.updateValidationList(value);
                          },
                          // onChanged: (value) {
                          //   if (controller.checkPasswordStrength) {
                          //     controller.updateValidationList(value);
                          //   }
                          // },
                          validator: (value) {
                            return controller.validatePassword(value ?? '');
                          },
                        )),
                    SizedBox(height: Dimensions.space15),
                    GetBuilder<AuthController>(
                      builder: (auth) {
                        Color getStrengthColor(double value) {
                          if (value < 0.4) return Colors.red;
                          if (value < 0.7) return Colors.orange;
                          return Colors.green;
                            //MyColor.labelTextColor.withValues(alpha: 0.5);
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 8.0,
                                activeTrackColor: getStrengthColor(auth.passwordStrength),
                                inactiveTrackColor: Colors.grey.shade300,
                                thumbColor: Colors.transparent,
                                overlayShape: SliderComponentShape.noOverlay,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                              ),
                              child: Slider(
                                value: auth.passwordStrength,
                                onChanged: null, // make it read-only
                                min: 0,
                                max: 1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              auth.passwordStrength < 0.4
                                  ? "Weak Password"
                                  : auth.passwordStrength < 0.7
                                  ? "Moderate Password"
                                  : "Your Passwordis great.Nice work!",
                              style: TextStyle(
                                color: getStrengthColor(auth.passwordStrength),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    //password strength slider
                    SizedBox(height: Dimensions.space25),
                    //loginbutton
                    RoundedButton(
                      color: MyColor.primaryColor,
                      borderColor: MyColor.primaryColor,
                      isLoading: controller.submitLoading,
                      text:"Sign Up".tr,
                      textStyle: boldExtraLarge.copyWith(
                        fontSize: 16,
                        color: MyColor.colorWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      press: () async {
                        Get.to(() => SmsVerificationScreen());
                      },
                    ),
                    SizedBox(height: Dimensions.space20),
                    //Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color:  MyColor.borderColor.withValues(alpha: 0.9),
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'or'.tr,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: MyColor.borderColor.withValues(alpha: 0.9),
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.space20),
                    // Continue with google & facebook
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.continueWithGoogle();
                            },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: Get.width *0.36,
                            decoration: BoxDecoration(
                                color: MyColor.colorWhite,
                                border: Border.all(
                                  width: 1,
                                  color:  MyColor.borderColor.withValues(alpha: 0.9),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: Get.height *0.02,
                                  width: Get.width *0.04,
                                  decoration: BoxDecoration(
                                      color: MyColor.colorRed2.withAlpha(70),
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(width: Dimensions.space5),
                                AppText(
                                  text: 'Google'.tr,
                                  style: semiBoldMediumLarge.copyWith(
                                      color: MyColor.colorBlack,
                                      fontSize: Dimensions.fontLarge),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.space30),
                        GestureDetector(
                          onTap: (){
                            controller.continueWithPhone();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: Get.width *0.36,
                            decoration: BoxDecoration(
                                color: MyColor.colorWhite,
                                border: Border.all(
                                  width: 1,
                                  color:  MyColor.borderColor.withValues(alpha: 0.9),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: Get.height *0.02,
                                  width: Get.width *0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(width: Dimensions.space5),
                                AppText(
                                  text: 'Facebook'.tr,
                                  style: semiBoldMediumLarge.copyWith(
                                      color: MyColor.colorBlack,
                                      fontSize: Dimensions.fontLarge),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.space30),
                  // Widget
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () => GestureDetector(
                            onTap: () => controller.isChecked.toggle(),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: controller.isChecked.value
                                    ? MyColor.primaryColor
                                    : MyColor.colorWhite,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: MyColor.primaryColor, width: 2),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 18,
                                color: controller.isChecked.value
                                    ? MyColor.colorWhite
                                    : MyColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: regularExtraLarge.copyWith(
                                color: MyColor.rideSub,
                                fontSize: Dimensions.fontLarge,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                  'By clicking Create account, I agree that I\nhave read and accepted the ',
                                ),
                                TextSpan(
                                  text: 'Terms of Use ',
                                  style: regularExtraLarge.copyWith(
                                    color: MyColor.primaryColor,
                                    fontSize: Dimensions.fontLarge,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  'and ',
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: regularExtraLarge.copyWith(
                                    color: MyColor.primaryColor,
                                    fontSize: Dimensions.fontLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.space100),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: regularExtraLarge.copyWith(
                            color: MyColor.rideSub,
                            fontSize: Dimensions.fontLarge),
                        children: [
                          TextSpan(text: 'Protected by reCAPTCHA and subject to the\n'.tr),
                          TextSpan(text: 'Prism '.tr),
                          TextSpan(
                            text: 'Privacy Policy'.tr,
                            style: regularExtraLarge.copyWith(
                                color: MyColor.primaryColor,
                                fontSize: Dimensions.fontLarge),
                          ),
                          TextSpan(text: ' and '.tr,
                            style: regularExtraLarge.copyWith(
                                color: MyColor.rideSub,
                                fontSize: Dimensions.fontLarge),),
                          TextSpan(
                            text: 'Terms of Service. .'.tr,
                            style: regularExtraLarge.copyWith(
                                color: MyColor.primaryColor,
                                fontSize: Dimensions.fontLarge),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.space45),
                  ],
                ),
              ),
            ),

    );
  }
}
