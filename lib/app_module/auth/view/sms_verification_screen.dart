import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../Utils/app_imports/app_imports.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Routes/Routes.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/Widgets/willpopwidget.dart';
import '../../../utils/custom_widget/custom_text_field.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/round_button.dart';
import '../../../utils/custom_widget/style.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class SmsVerificationScreen extends StatelessWidget {
  const SmsVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: WillPopWidget(
        //nextRoute: Routes.LOGIN_SCREEN,
        child: Scaffold(
          backgroundColor: MyColor.colorWhite,
          appBar: AppBar(
            backgroundColor: Colors.transparent, // Important: transparent to show container color
            elevation: 0,
            title: Image.asset(MyImages.appLogopng, height: 45, width: 100),
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            leading: Container(
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios, color: MyColor.primaryTextColor),
              ),
            ),
          ),
          body: GetBuilder<AuthController>(
            builder: (controller) => controller.isLoading && false
                ? Center(
                child: CircularProgressIndicator(
                    color: MyColor.getPrimaryColor()))
                : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: Dimensions.screenPaddingHV,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: Dimensions.space10),
                      // Row(
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         Get.back();
                      //       },
                      //       child: Icon(
                      //         Icons.arrow_back,
                      //         color: MyColor.getTextColor(),
                      //       ),
                      //     ),
                      //     //Spacer(),
                      //     Image.asset(MyImages.appLogopng, height: 45, width: 100),
                      //     // SvgPicture.asset(
                      //     //   MyImages.appLogopng,
                      //     //   height: 35,
                      //     //   width: 100,
                      //     // ),
                      //     Spacer(),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //   ],
                      // ),

                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            top: Dimensions.space20,
                            bottom: Dimensions.space20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height:Dimensions.space20),
                            Text(
                              "Email Verification".tr,
                              style: boldExtraLarge.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: Dimensions.space5),
                            Text(
                              'We sent a verification code to\n***1yz@gmail.com',
                              style: regularDefault.copyWith(
                                  color: MyColor.getBodyTextColor(),
                                  fontSize: Dimensions.fontLarge),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height * .04),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.space30),
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: regularDefault.copyWith(
                                    color: MyColor.getPrimaryColor()),
                                length: 6,
                                textStyle: regularDefault.copyWith(
                                    color: MyColor.getPrimaryColor()),
                                obscureText: false,
                                obscuringCharacter: '*',
                                blinkWhenObscuring: false,
                                animationType: AnimationType.slide,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8),
                                  borderWidth: 1,
                                  fieldHeight: 40,
                                  fieldWidth: 40,
                                  inactiveColor:
                                  MyColor.getTextFieldDisableBorder(),
                                  inactiveFillColor:
                                  MyColor.getScreenBgColor(),
                                  activeFillColor:
                                  MyColor.getScreenBgColor(),
                                  activeColor: MyColor.getPrimaryColor(),
                                  selectedFillColor:
                                  MyColor.getScreenBgColor(),
                                  selectedColor: MyColor.getPrimaryColor(),
                                ),
                                cursorColor: MyColor.getTextColor(),
                                animationDuration:
                                const Duration(milliseconds: 100),
                                enableActiveFill: true,
                                keyboardType: TextInputType.number,
                                beforeTextPaste: (text) {
                                  return true;
                                },
                                onCompleted: (value) {

                                },
                                onChanged: (value) {

                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.space30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Didn't receive the code?".tr,
                                      style: regularDefault.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: MyColor.getLabelTextColor())),
                                  const SizedBox(width: Dimensions.space5),
                                  controller.resendLoading
                                      ? Container(
                                      margin: const EdgeInsets.all(5),
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          color: MyColor
                                              .getPrimaryColor()))
                                      : GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {},
                                    child: Text(
                                        "Resend".tr,
                                        style: regularDefault.copyWith(
                                          //fontSize: 11,
                                            decoration: TextDecoration.underline,
                                            color: MyColor.getPrimaryColor())),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Dimensions.space100),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: Dimensions.space20,
                                  end: Dimensions.space20),
                              child: RoundedButton(
                                color: MyColor.primaryColor,
                                borderColor: MyColor.primaryColor,
                                textStyle: boldExtraLarge.copyWith(
                                  fontSize: 16,
                                  color: MyColor.colorWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                                textColor: MyColor.colorWhite,
                                isLoading: controller.submitLoading,
                                text: "Confirm".tr,
                                press: () {},
                              ),
                            ),

                            // SizedBox(
                            //   height: 20,
                            // ),
                            // GestureDetector(
                            //   onTap: () async {
                            //     Get.to(() => SignUpScreen());
                            //   },
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back,
                            //         size: 16,
                            //       ),
                            //       SizedBox(
                            //         width: 10,
                            //       ),
                            //       Text("Sign Up",
                            //           style: regularDefault.copyWith(
                            //               color:
                            //               MyColor.getLabelTextColor())),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
