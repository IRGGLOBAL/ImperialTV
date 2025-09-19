import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/Images/my_images.dart';
import '../../../utils/Paddings/AppPaddings.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/my_color.dart';
import '../../auth/view/login_screen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after build is done
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.off(() => const LoginScreen()); // Removes splash screen from navigation stack
      });
    });

    return Scaffold(
      backgroundColor: MyColor.colorWhite,
      body:   Stack(
        children: [
          Positioned.fill(
            child:
            Opacity(
                opacity: 1,
                child:
                Image.asset(
                  MyImages.splashscreen,
                  fit: BoxFit.fill,
                ),
            )
          ),

          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(MyImages.appLogo,
                  height: 60, width: 60)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: AppText(
                    text: "App Version 3.4",
                  size: 14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.colorWhite
                ),
              )
              ),
        ],
      ),
    );
  }
}



