import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
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
  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: MyColor.colorBlack,
          appBar:  AppBar(
            backgroundColor: MyColor.colorBlack,
            elevation: 0,
            title: SvgPicture.asset(MyImages.appLogo, height: 45, width: 45),
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            leading: Container(
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
              ),
            ),
          ),

          body: GetBuilder<AuthController>(
            builder: (auth) => SingleChildScrollView(
              //padding: Dimensions.screenPaddingHV,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:Dimensions.space20),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                          top: Dimensions.space20,
                          start: Dimensions.space20,
                          end: Dimensions.space20,
                          bottom: Dimensions.space20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height:Dimensions.space20),
                            Align(
                                alignment: Alignment.topLeft,
                                child: AppText(
                                  text: MyStrings.forgotpassword.tr,
                                  style: semiBoldMediumLarge.copyWith(
                                      color: MyColor.colorWhite,
                                      fontSize: Dimensions.fontExtraLarge + 7,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                          ),
                            const SizedBox(height: Dimensions.space10),
                            Align(
                              alignment: Alignment.topLeft,
                              child:
                              AppText(
                                text: MyStrings.noworriestJustenteryour.tr,
                                style: semiBoldMediumLarge.copyWith(
                                    color: MyColor.colorWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Dimensions.fontedium),
                                textAlign: TextAlign.start,
                              ),
                              //heightFactor: 1,
                            ),
                            const SizedBox(height: Dimensions.space40),
                            CustomTextField(
                              radius: 10,
                              animatedLabel: true,
                              needOutlineBorder: true,
                              hintText: "abc@gmail.com".tr,
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              controller: auth.emailOrUsernameController,
                              onSuffixTap: () {},
                              onChanged: (value) {
                                return;
                              },
                              validator: (value) {
                                if (auth
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
