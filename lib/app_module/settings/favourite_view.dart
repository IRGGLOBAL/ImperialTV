import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../utils/Fonts/AppDimensions.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/my_color.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({super.key});

  // Example static data (replace with controller data if needed)

  final List<Map<String, String>> favourites = [
    {
      "title": "The Rainmaker",
      "subtitle": "1 Hour 30 Min | Romance",
    },
    {
      "title": "The Summit",
      "subtitle": "1 Hour 30 Min | Romance",
    },
    {
      "title": "Jewel in the Palace",
      "subtitle": "1 Hour 30 Min | Romance",
    },
    {
      "title": "Sweet Dreams",
      "subtitle": "1 Hour 30 Min | Romance",
    },
    {
      "title": "The Wildest Dream",
      "subtitle": "1 Hour 30 Min | Romance",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorback,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorback,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.myfavourites.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color:MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite,),
          onPressed: () {
            Get.back();
          },
        ),

      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          final item = favourites[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: MyColor.colorBlack,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Thumbnail
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),

                // Title & Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: item["title"] ?? "",
                        size: AppDimensions.FONT_SIZE_14,
                        fontWeight: FontWeight.w600,
                        color: MyColor.colorWhite,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        text: item["subtitle"] ?? "",
                        size: AppDimensions.FONT_SIZE_12,
                        fontWeight: FontWeight.w400,
                        color: MyColor.colorWhite.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),

                // Play button
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  onPressed: () {
                    // Play action
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
