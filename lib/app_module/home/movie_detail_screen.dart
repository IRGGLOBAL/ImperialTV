import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/Widgets/AppText.dart';
import '../../utils/custom_widget/dimensions.dart';
import '../../utils/custom_widget/my_color.dart';
import '../../utils/Images/my_images.dart';
import '../../utils/text_strings.dart';
import 'home_controller.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String banner;
  final String duration;
  final String rating;
  final String genre;
  final String synopsis;

   MovieDetailScreen({
    super.key,
    this.title = "Ghost of Yotei",
    this.banner = MyImages.topbanner,
    this.duration = "2hr 10m",
    this.rating = "R",
    this.genre = "Action, Crime, Thriller",
    this.synopsis =
    "In this third installment of the adrenaline-fueled action franchise, "
        "super-assassin John Wick returns with a \$14 million price tag on his head "
        "and an army of bounty-hunting.",
  });

  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Top Banner with Gradient
              Stack(
                children: [
                  Image.asset(
                    banner,
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                          MyColor.colorBlack,
                        ],
                      ),
                    ),
                  ),
                  /// Top Navigation
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 55,
                      //color: MyColor.secondaryColor,
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space16, /*vertical: Dimensions.space10*/),
                      child: Row(
                        children: [

                          // Profile Avatar
                          Column(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: MyColor.transparentColor,
                                  shape: BoxShape.circle,
                                ),
                                child:SvgPicture.asset(
                                  MyImages.profileicon,
                                ),
                                //Icon(Icons.person_pin, color: MyColor.colorWhite, size: 20),
                              ),
                              AppText(
                                text: MyStrings.name.tr,
                                color: MyColor.colorWhite,
                                size: Dimensions.fontSmall,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),

                          Spacer(),

                          // Tab Navigation
                          Row(
                            children: [
                              AppText(
                                text: MyStrings.tvseries,
                                color: MyColor.colorWhite,
                                size: Dimensions.fontedium,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(width: Dimensions.space20),
                              AppText(
                                text: MyStrings.movies,
                                color: MyColor.colorWhite,
                                size: Dimensions.fontedium,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),

                          Spacer(),
                          // search
                          GestureDetector(
                            onTap: (){
                             // Get.to(()=> SearchScreen());
                            },
                            child: Container(
                              width: 40,
                              child: SvgPicture.asset(
                                MyImages.notification,
                              ),
                              //Icon(Icons.search, color: MyColor.colorWhite, size: 40),
                            ),
                          ),

                        ],
                      ),
                    )
                  ),
                  /// Title
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back,
                              color: Colors.white, size: 26),
                        ),
                        AppText(
                          text: title,
                          color: Colors.white,
                          size: Dimensions.fontExtraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Title & Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      color: Colors.white,
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 6),
                    AppText(
                      text: "$duration | $rating",
                      color: Colors.white70,
                      size: Dimensions.fontSmall,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: genre,
                      color: Colors.white70,
                      size: Dimensions.fontSmall,
                    ),
                    const SizedBox(height: 16),

                    /// Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: MyColor.transparentColor,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: MyColor.colorWhite),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, color: MyColor.colorWhite, size: 24),
                              SizedBox(width: 8),
                              AppText(
                                text: MyStrings.playnow,
                                color: MyColor.colorWhite,
                                size: Dimensions.fontMedium,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Dimensions.space15),
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: MyColor.buttontextlightblue,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: MyColor.buttontextlightblue),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(MyImages.bookIcon,width: 18,),
                              SizedBox(width: 8),
                              AppText(
                                text: MyStrings.download,
                                color: MyColor.colorWhite,
                                size: Dimensions.fontMedium,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              /// Tabs with reactive state
              Obx(() => Container(
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                margin: EdgeInsets.symmetric(horizontal: Dimensions.space25),
                padding: EdgeInsets.symmetric(vertical: Dimensions.space2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTab("Detail", 0),
                    _buildTab("Cast", 1),
                    _buildTab("Showtime", 2),
                  ],
                ),
              )),

              const SizedBox(height: 20),

              /// Tab content
            Obx(() {
                  switch (c.selectedTab.value) {
                    case 0:
                    /// Synopsis
                      return     /// Synopsis with Show More functionality
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.space16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Synopsis",
                                color: Colors.white,
                                size: Dimensions.fontMedium,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(height: 10),

                              // Reactive text widget
                              Obx(() => AppText(
                                text: synopsis,
                                color: Colors.white70,
                                size: Dimensions.fontSmall,
                                maxLines: c.isSynopsisExpanded.value ? null : 3,
                                overflow: c.isSynopsisExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
                              )),

                              const SizedBox(height: 10),

                              // Reactive button widget
                              Obx(() {
                                // Only show button if text is long enough to need truncation
                                if (_needsShowMore(synopsis, context)) {
                                  return GestureDetector(
                                    onTap: () => c.toggleSynopsis(),
                                    child: Text(
                                      c.isSynopsisExpanded.value ? "Show Less" : "Show More",
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink(); // Hide button if text is short
                              }),
                            ],
                          ),
                        );
                      //   Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: Dimensions.space16),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       AppText(
                      //         text: "Synopsis",
                      //         color: Colors.white,
                      //         size: Dimensions.fontMedium,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //       const SizedBox(height: 10),
                      //       AppText(
                      //         text: synopsis,
                      //         color: Colors.white70,
                      //         size: Dimensions.fontSmall,
                      //         maxLines: 4,
                      //       ),
                      //       const SizedBox(height: 10),
                      //       GestureDetector(
                      //         onTap: () {},
                      //         child: const Text(
                      //           "Show More",
                      //           style: TextStyle(
                      //             color: Colors.lightBlueAccent,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    case 1:
                      return Center(
                          child: AppText(
                              text: "Cast Content",
                              color: Colors.white,
                              size: 16));
                    case 2:
                      return Center(
                          child: AppText(
                              text: "Showtime Content",
                              color: Colors.white,
                              size: 16));
                    default:
                      return const SizedBox.shrink();
                  }
                }),

              const SizedBox(height: 20),

              /// Trailer Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Trailer",
                      color: Colors.white,
                      size: Dimensions.fontMedium,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.play_circle_fill,
                              size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable tab widget
  Widget _buildTab(String text, int index) {
    bool isActive = c.selectedTab.value == index;

    return GestureDetector(
      onTap: () => c.changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
        decoration: BoxDecoration(
          color: isActive ? MyColor.buttontextlightblue : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child:   AppText(
          text:  text,
          color: isActive ? Colors.white : Colors.grey,
          size: Dimensions.fontSmall,
          fontWeight: FontWeight.w500,
        ),

      ),
    );
  }



  // Helper method to check if text needs "Show More" button
  bool _needsShowMore(String text, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: Dimensions.fontSmall,
          color: Colors.white70,
        ),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - Dimensions.space16 * 2);
    return textPainter.didExceedMaxLines;
  }



}


