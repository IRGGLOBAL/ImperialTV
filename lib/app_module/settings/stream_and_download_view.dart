import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/settings/settings_controller.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';

class StreamAndDownloadView extends StatelessWidget {
  StreamAndDownloadView({super.key});

  final DownloadController controller = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorback,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: MyColor.transparentColor,
        backgroundColor: MyColor.colorback,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () {
            Get.back();
          },
        ),
        title: AppText(
          text: MyStrings.mydownloads.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.colorWhite,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: MyColor.colorWhite),
            onPressed: () => Get.toNamed('/search'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab(MyStrings.all.tr, 0),
                const SizedBox(width: 8),
                _buildTab(MyStrings.finish.tr, 1),
                const SizedBox(width: 8),
                _buildTab(MyStrings.failed.tr, 2),
              ],
            ),
          ),

          // List
          Expanded(
            child: Obx(() {
              final filteredDownloads = controller.filteredDownloads;

              return filteredDownloads.isEmpty
                  ? Center(
                child: AppText(
                  text: MyStrings.nodownloads.tr,
                  color: MyColor.colorWhite.withOpacity(0.7),
                  size: AppDimensions.FONT_SIZE_14,
                ),
              )
                  : ListView.builder(
                itemCount: filteredDownloads.length,
                itemBuilder: (context, index) {
                  final item = filteredDownloads[index];
                  return _buildDownloadItem(item);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == index;
      return GestureDetector(
        onTap: () => controller.selectTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? MyColor.secondaryColor : MyColor.colorBlack,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            text: text,
            size: AppDimensions.FONT_SIZE_14,
            color: MyColor.colorWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    });
  }

  Widget _buildDownloadItem(DownloadItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColor.colorBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Thumbnail
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: item.status == DownloadStatus.finished
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),

              // Title & Subtitle & action buttons
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: item.title,
                      size: AppDimensions.FONT_SIZE_14,
                      fontWeight: FontWeight.w600,
                      color: MyColor.colorWhite,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: item.subtitle,
                      size: AppDimensions.FONT_SIZE_12,
                      color: MyColor.colorWhite.withOpacity(0.7),
                    ),
                    // Progress bar (red line)
                    const SizedBox(height: 8),
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: item.progress.clamp(0.0, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColor.secondaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Buttons depending on status
                    if (item.status == DownloadStatus.downloading)
                      Row(
                        children: [
                          _actionButton(
                            item.isPaused ? MyStrings.resume.tr : MyStrings.pause.tr,
                            MyColor.transparentColor,
                                () => controller.togglePause(item),
                          ),
                          const SizedBox(width: 8),
                          _actionButton(
                            MyStrings.cancel.tr,
                            MyColor.transparentColor,
                                () => controller.cancelItem(item),
                          ),
                        ],
                      )
                    else if (item.status == DownloadStatus.failed)
                      Row(
                        children: [
                          _actionButton(MyStrings.retry.tr, MyColor.transparentColor,
                                  () => controller.retryItem(item)),
                          const SizedBox(width: 8),
                          _actionButton(MyStrings.cancel.tr, MyColor.transparentColor,
                                  () => controller.cancelItem(item)),
                        ],
                      )
                    else if (item.status == DownloadStatus.finished)
                        const SizedBox.shrink(),
                  ],
                ),
              ),

              // Play icon (always available)
              IconButton(
                icon: Icon(Icons.play_arrow, color: MyColor.colorWhite),
                onPressed: () => controller.playItem(item),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, Color bgColor, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: MyColor.colorWhite, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: AppText(
          text: label,
          size: AppDimensions.FONT_SIZE_12,
          color: MyColor.colorWhite,
        ),
      ),
    );
  }
}


