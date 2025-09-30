import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/settings/settings_controller.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/text_strings.dart';


class SubscriptionView extends StatelessWidget {
  SubscriptionView({Key? key}) : super(key: key);

  final DownloadController controller = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    MyImages.box,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 20),
                AppText(
                  text: MyStrings.chooseyourplan.tr,
                  size: AppDimensions.FONT_SIZE_20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),

                // Title with dividers
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(1),
                        thickness: 0.5,
                        endIndent: 8,
                      ),
                    ),
                    AppText(
                      text: MyStrings.sevendayfreetrial.tr,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(1),
                        thickness: 0.5,
                        indent: 8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Plans list
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.plans.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final plan = controller.plans[index];

                    return GestureDetector(
                      onTap: () => controller.selectPlan(index),
                      child: Obx(() {
                        final isSelected = controller.selectedIndex.value == index;

                        return Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF070707),
                                Color(0xFF0F0C29),
                                Color(0xFF635E9E),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? MyColor.secondaryColor
                                  : MyColor.transparentColor,
                              width: isSelected ? 2 : 1,
                            ),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (plan["name"] == "Standard")
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: MyColor.secondaryColor,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: AppText(
                                    text: MyStrings.recommended.tr.toUpperCase(),
                                    size: AppDimensions.FONT_SIZE_12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (plan["name"] != "Standard")
                                          const SizedBox(height: 16),
                                        AppText(
                                          text: plan["name"]!,
                                          size: AppDimensions.FONT_SIZE_16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 4),
                                        AppText(
                                          text: plan["desc"]!,
                                          fontWeight: FontWeight.w400,
                                          size: AppDimensions.FONT_SIZE_12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppText(
                                        text: plan["price"]!,
                                        size: AppDimensions.FONT_SIZE_16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 2),
                                      AppText(
                                        text: plan["period"]!,
                                        size: AppDimensions.FONT_SIZE_14,
                                        fontWeight: FontWeight.w400,
                                        height: 2,
                                        color: Colors.white70,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(Icons.chevron_right, color: MyColor.colorWhite),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
                const SizedBox(height: 40),
                AppText(
                  text: MyStrings.cancelanytimeintheappstore.tr,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),

                // Bottom Button
                Obx(() => AppButton(
                  buttonName: "${MyStrings.continuewith.tr} ${controller.plans[controller.selectedIndex.value]["price"]}${controller.plans[controller.selectedIndex.value]["period"]}",
                  buttonColor: MyColor.secondaryColor,
                  textColor: Colors.white,
                  textSize: Dimensions.fontedium,
                  fontWeight: FontWeight.w600,
                  buttonWidth: double.infinity,
                  buttonHeight: 50,
                  buttonRadius: BorderRadius.circular(30),
                  onTap: controller.proceedToSubscription,
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}