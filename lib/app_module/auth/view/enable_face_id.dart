import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imperialtv/app_module/auth/view/sms_verification_screen.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/style.dart';
import '../controller/auth_controller.dart';


class EnableFaceId extends StatefulWidget {
  const EnableFaceId({super.key});

  @override
  State<EnableFaceId> createState() => _EnableFaceIdState();
}

class _EnableFaceIdState extends State<EnableFaceId> {
  bool agreed = false;

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    SvgPicture.asset(
                        MyImages.enablefaceid,
                        // height: 100,
                        // width: 100,
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
                        if (agreed) {
                          Get.to(() => const SmsVerificationScreen());
                        }
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
                            AppText(
                              text: MyStrings.maybelater.tr,
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


            ],
          ),
        ),
      ),
    );
  }

}
