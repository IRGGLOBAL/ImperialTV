import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/Fonts/AppDimensions.dart';
import 'package:imperialtv/utils/Widgets/AppText.dart';
import 'package:imperialtv/utils/custom_widget/my_color.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../data/models/notification_model.dart';
import 'notification_controller.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  final NotificationController c = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        title: AppText(
          text: MyStrings.notifications.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),

        ],
      ),
      body: Obx(
            () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: c.notifications.length,
          itemBuilder: (context, index) {
            final item = c.notifications[index];
            return _notificationTile(item);
          },
        ),
      ),
    );
  }

  Widget _notificationTile(NotificationModel item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left side: Red dot + Image
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: item.isUnread ? Colors.red : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                item.svg, // ✅ svg path from model
                width: 50,
                height: 50,
              ),
            ],
          ),
          const SizedBox(width: 12),

          /// Right side: Title, subtitle, time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: item.title,
                  size: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                AppText(
                  text: item.subtitle,
                  size: AppDimensions.FONT_SIZE_12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                AppText(
                  text: item.timeOrDate,
                  size: AppDimensions.FONT_SIZE_10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
