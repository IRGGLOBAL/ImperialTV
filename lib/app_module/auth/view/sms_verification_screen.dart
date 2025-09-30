import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
import '../../bottom_bar/bottom_bar_view.dart';
import '../../home/home_view.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class SmsVerificationScreen extends StatelessWidget {
  const SmsVerificationScreen({super.key});

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

                    Positioned(
                      top:  20,
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
                              text: MyStrings.entertheverificationcode.tr,
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.colorWhite,
                                  fontSize: Dimensions.fontOverLarge2 + 8,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.start
                          ),
                          SizedBox(height: 8),
                          AppText(
                              text: MyStrings.wehavesentadigitcodetoyour.tr,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.space30
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: regularDefault.copyWith(
                                  color: MyColor.getPrimaryColor()
                              ),
                              length: 5,
                              textStyle: regularDefault.copyWith(
                                  color: MyColor.getPrimaryColor()
                              ),
                              obscureText: false,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: false,
                              animationType: AnimationType.slide,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                borderWidth: 0.5,
                                fieldHeight: 50,
                                fieldWidth: 50,
                                inactiveColor: MyColor.borderColor,
                                inactiveFillColor: MyColor.getScreenBgColor(),
                                activeFillColor: MyColor.getScreenBgColor(),
                                activeColor: MyColor.secondaryColor,
                                selectedFillColor: MyColor.getScreenBgColor(),
                                selectedColor: MyColor.secondaryColor,
                              ),
                              cursorColor: MyColor.getTextColor(),
                              animationDuration: const Duration(milliseconds: 100),
                              enableActiveFill: true,
                              keyboardType: TextInputType.number,
                              beforeTextPaste: (text) {
                                return true;
                              },
                              onCompleted: (value) {
                                // Handle completion
                              },
                              onChanged: (value) {
                                // Handle change
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          AppText(
                              text: "${MyStrings.sendcodeagain.tr} 00:34",
                              style: semiBoldMediumLarge.copyWith(
                                  color: MyColor.primaryColor,
                                  fontSize: Dimensions.fontSmall,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center
                          ),
                          const SizedBox(height: Dimensions.space100),
                          AppButton(
                            buttonName: MyStrings.verification.tr,
                            buttonColor: MyColor.secondaryColor,
                            textColor: MyColor.colorWhite,
                            textSize: Dimensions.fontedium,
                            fontWeight: FontWeight.w600,
                            hasShadow: false,
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            onTap: () {
                               Get.to(()=> MyHomePage());
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