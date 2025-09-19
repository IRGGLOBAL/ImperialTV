import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/auth/view/signup_screen.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Widgets/AppButton.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/dimensions.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../../utils/custom_widget/style.dart';
import '../../../utils/text_strings.dart';
import '../controller/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Add this import for your custom button


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepSignedIn = false;

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
              const SizedBox(height: 28),
              // Top logo
              SvgPicture.asset(MyImages.appLogo,
                  height: 60, width: 60),
              const SizedBox(height: 24),

              // Headline and tagline
              AppText(
                text:   MyStrings.loginheadline.tr,
                style: semiBoldMediumLarge.copyWith(
                  color: MyColor.colorWhite.withOpacity(0.9),
                  fontSize: Dimensions.fontLarge,
                  fontWeight: FontWeight.w500,
                  height: 1.5,),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              AppText(
                text: MyStrings.yourjourneystartshere.tr,
                style: semiBoldMediumLarge.copyWith(
                  color: MyColor.colorWhite.withOpacity(0.7),
                  fontSize: Dimensions.fontDefault,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              // Card panel
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                  color: MyColor.colorWhite .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child:
                      AppText(
                        text: MyStrings.registernow.tr,
                        style: semiBoldMediumLarge.copyWith(
                          color: MyColor.colorWhite,
                          fontSize: Dimensions.fontMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Continue with email - Replaced with AppButton
                    AppButton(
                      buttonName: MyStrings.continuewithemail.tr,
                      buttonColor: Colors.white,
                      textColor: MyColor.primaryTextColor,
                      textSize: Dimensions.fontMedium,
                      fontWeight: FontWeight.w500,
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
                    const SizedBox(height: 12),

                    // Continue with Phone - Replaced with AppButton
                    AppButton(
                      buttonName: MyStrings.continuewithhone.tr,
                      buttonColor: Colors.white,
                      textColor: MyColor.primaryTextColor,
                      textSize: Dimensions.fontMedium,
                      fontWeight: FontWeight.w500,
                      hasShadow: false,
                      buttonWidth: double.infinity,
                      buttonHeight: 50,
                      onTap: () {
                        controller.continueWithPhone();
                      },
                      elevation: 0,
                      borderWidth: 0,
                      isCenter: true,
                      buttonRadius: BorderRadius.circular(8),
                    ),

                    const SizedBox(height: 12),
                    Center(
                      child: AppText(
                        text: MyStrings.or.tr,
                        style: semiBoldMediumLarge.copyWith(
                          color: MyColor.colorWhite.withOpacity(0.7),
                          fontSize: Dimensions.fontSmall,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Continue with Google - Replaced with AppButton
                    AppButton(
                      buttonName: MyStrings.continuewithgoogle.tr,
                      buttonColor: MyColor.primaryTextColor,
                      textColor: MyColor.colorWhite,
                      textSize: Dimensions.fontMedium,
                      fontWeight: FontWeight.w600,
                      applyColorToSvg: false,
                      hasShadow: false,
                      buttonWidth: double.infinity,
                      buttonHeight: 50,
                      onTap: () {
                        controller.continueWithGoogle();
                      },
                      elevation: 0,
                      borderWidth: 0,
                      isCenter: false,
                      isIcon: true,
                      iconImage: MyImages.googleicon,
                      iconSize: 24,
                      //iconColor: ic,
                      paddingButton: 8,
                      buttonRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),
              Center(
                child: AppText(
                  text: MyStrings.donthaveanaccount.tr,
                  style: semiBoldMediumLarge.copyWith(
                    color: MyColor.colorWhite.withOpacity(0.7),
                    fontSize: Dimensions.fontDefault,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 14),

              // Sign Up Now pill button - Replaced with AppButton
              AppButton(
                buttonName: MyStrings.signupnow.tr,
                buttonColor: Colors.transparent,
                textColor: MyColor.colorWhite,
                textSize: Dimensions.fontedium,
                fontWeight: FontWeight.w600,
                hasShadow: false,
                buttonWidth: double.infinity,
                buttonHeight: 50,
               // onTap: (){},
                onTap: () => Get.to(() => const SignUpScreen()),
                elevation: 0,
                borderWidth: 1,
                borderColor: Colors.white,
                isCenter: true,
                buttonRadius: BorderRadius.circular(25), // Stadium shape
              ),

              const SizedBox(height: 12),
              // Legal text
              Text.rich(
                TextSpan(
                  text: MyStrings.Joiningourappmeansyouagreewithour.tr,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 11,
                  ),
                  children:  [
                    TextSpan(
                      text: MyStrings.termofuse.tr ,
                      style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: MyStrings.and.tr ,),
                    TextSpan(
                      text: MyStrings.privacypolicy.tr,
                      style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Remove the _FilledPillButton and _OutlinedIconButton classes since we're using AppButton instead

class CustomUnderlineText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double fontSize;
  final double underlineGap;
  final double underlineThickness;

  const CustomUnderlineText({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.white,
    this.fontSize = 14,
    this.underlineGap = 4,
    this.underlineThickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -underlineGap,
            child: Container(
              height: underlineThickness,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}