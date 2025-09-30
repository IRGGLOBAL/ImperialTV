import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppButton.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';
import '../settings/settings_controller.dart';

class SubscriptionDetailsView extends StatelessWidget {
  final DownloadController controller = Get.find<DownloadController>();

  SubscriptionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
    PageController(initialPage: controller.selectedIndex.value);

    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () => Get.back(),
        ),
        title: AppText(
          text: MyStrings.subscribe.tr,
          size: AppDimensions.FONT_SIZE_18,
          fontWeight: FontWeight.bold,
          color: MyColor.colorWhite,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            AppText(
              text: MyStrings.subscribetoenjoyyourlovelymovies.tr,
              size: AppDimensions.FONT_SIZE_20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            AppText(
              text:
              MyStrings.wewillhelpyoutobookyourlovelymovies.tr,
              size: AppDimensions.FONT_SIZE_14,
              color: Colors.white70,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /// PageView for Plans
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: controller.plans.length,
                onPageChanged: (index) => controller.selectPlan(index),
                itemBuilder: (context, index) {
                  final plan = controller.plans[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: MyColor.secondaryColor, width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: plan["name"]!,
                          size: AppDimensions.FONT_SIZE_20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: plan["price"]!,
                          size: AppDimensions.FONT_SIZE_35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        AppText(
                          text: plan["period"]!,
                          size: AppDimensions.FONT_SIZE_14,
                          color: Colors.white70,
                        ),
                        const SizedBox(height: 20),

                        /// Features
                        _buildFeature(MyStrings.videoabdsoundquality.tr, "Great"),
                        _buildFeature(MyStrings.resolution.tr, "1080p (Full HD)"),
                        _buildFeature(MyStrings.supporteddevices.tr, MyStrings.tvcomputermobilephonetablet.tr),
                        _buildFeature(MyStrings.watchdevicesatthesametime.tr, "2"),
                        _buildFeature(MyStrings.downloaddevices.tr, "2"),

                        const SizedBox(height: 30),
                        AppButton(
                          buttonName: MyStrings.subscribe.tr,
                          buttonColor: MyColor.secondaryColor,
                          textColor: Colors.white,
                          textSize: AppDimensions.FONT_SIZE_16,
                          fontWeight: FontWeight.bold,
                          buttonWidth: double.infinity,
                          buttonHeight: 50,
                          buttonRadius: BorderRadius.circular(30),
                          onTap: controller.proceedToSubscription,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppText(
              text: title,
              size: AppDimensions.FONT_SIZE_12,
              color: MyColor.colorWhite,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppText(
              text: value,
              size: AppDimensions.FONT_SIZE_12,
              fontWeight: FontWeight.w600,
              color: MyColor.colorWhite,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

}
