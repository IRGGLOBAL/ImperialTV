import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: "Splash Screen")
            ],
          ),
        ),
      ),
    );
  }
}
