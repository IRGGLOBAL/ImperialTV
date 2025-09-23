import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/search_screen/search_activity_controller.dart';
import 'package:imperialtv/utils/custom_widget/my_color.dart';
import 'package:imperialtv/utils/text_strings.dart';

import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';

class SearchScreen extends StatelessWidget {

  final SearchActivityController c = Get.put(SearchActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F2D), // dark gradient bg
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: MyStrings.searchmovie.tr,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Recent Search
              AppText(
                text:  MyStrings.recentsearch.tr,
                color: MyColor.colorWhite,
                size: Dimensions.fontLarge,
                fontWeight: FontWeight.bold,
              ),

              Obx(() => Column(
                children: c.recentSearches
                    .map((item) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.access_time_outlined, color: Colors.white),
                  title: AppText(
                    text: item,
                    color: MyColor.colorWhite,
                    size: Dimensions.fontLarge,
                    fontWeight: FontWeight.w500,
                  ),
                ))
                    .toList(),
              )),

              const SizedBox(height: 10),

              /// Trending Search
              AppText(
                text:  MyStrings.trendingsearch.tr ,
                color: MyColor.colorWhite,
                size: Dimensions.fontLarge,
                fontWeight: FontWeight.bold,
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: c.trendingSearches.length,
                  itemBuilder: (context, index) {
                    final movie = c.trendingSearches[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Poster
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              movie["poster"]!,
                              height: 80,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),

                          /// Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppText(
                                        text:   movie["title"]!,
                                        color: MyColor.colorWhite,
                                        size: Dimensions.fontLarge,
                                        fontWeight: FontWeight.bold,
                                      ),

                                    ),

                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    AppText(
                                      text: movie["year"]! +" •",
                                      color: MyColor.colorWhite,
                                      size: Dimensions.fontSmall,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(width: 5,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade700,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child:  AppText(
                                        text: movie["rating"]!,
                                        color: MyColor.colorWhite,
                                        size: Dimensions.fontExtraSmall,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                AppText(
                                  text: movie["genre"]!,
                                  color: MyColor.colorWhite,
                                  size: Dimensions.fontSmall,
                                  fontWeight: FontWeight.w500,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
