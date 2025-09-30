import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/settings/settings_controller.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Paddings/AppPaddings.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/text_strings.dart';


class ChangeLanguagesView extends StatelessWidget {
  ChangeLanguagesView({Key? key}) : super(key: key);

  final DownloadController c = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: AppText(
          text: MyStrings.changelanguage.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color:MyColor.colorWhite,
        ),
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: MyColor.transparentColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF070707),
              Color(0xFF0F0C29),
              Color(0xFF24243E),
              Color(0xFF070707),
            ],
          ),
        ),
        padding: AppPaddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            // Choose Mode card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                //color: MyColor.colorWhite,
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF070707),
                    Color(0xFF0F0C29),
                    Color(0xFF635E9E),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _buildRadioOption(
                    title: MyStrings.followthesystem.tr,
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  _buildRadioOption(
                    title:  MyStrings.english.tr,
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  _buildRadioOption(
                    title:  MyStrings.chinese.tr,
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  _buildRadioOption(
                    title:  MyStrings.francais.tr,
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  _buildRadioOption(
                    title:  MyStrings.deutsch.tr,
                  ),
                  Divider(thickness: 0.5,color: MyColor.borderColor,),
                  _buildRadioOption(
                    title:  MyStrings.espanol.tr,
                  ),
                ],
              ),
            ),

            Spacer(),

            AppButton(
              buttonName: "${MyStrings.done.tr}",
              buttonColor: MyColor.secondaryColor,
              textColor: Colors.white,
              textSize: Dimensions.fontedium,
              fontWeight: FontWeight.w600,
              buttonWidth: double.infinity,
              buttonHeight: 50,
              buttonRadius: BorderRadius.circular(30),
              onTap: (){

              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
  }) {
    return InkWell(
      onTap: () => c.changeMode(title),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w500,
                  color: MyColor.colorWhite,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          // check button
          Obx(() => Checkbox(
            value: c.selectedMode.value == title, // Compare with current selected mode
            onChanged: (val) {
              if (val != null && val) {
                c.changeMode(title); // Only change mode when checked (val is true)
              }
            },
            shape: const CircleBorder(),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            activeColor: MyColor.secondaryColor, // Use your app's primary color
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),

        ],
      ),
    );
  }
}
