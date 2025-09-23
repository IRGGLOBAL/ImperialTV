// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../../utils/Widgets/AppButton.dart';
// import '../../utils/Widgets/AppText.dart';
// import '../../utils/custom_widget/dimensions.dart';
// import '../../utils/custom_widget/my_color.dart';
// import '../../utils/text_strings.dart';
//
// class HomeContentView extends StatelessWidget {
//   const HomeContentView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black, // Pure black background like Netflix
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top Navigation
//               _buildNetflixTopNavigation(),
//
//               // Hero Section
//               _buildNetflixHeroSection(),
//
//               // Content Sections
//               _buildNetflixContinueWatchingSection(),
//               _buildNetflixTrendingSection(),
//               _buildNetflixTop10Section(),
//               _buildNetflixGenresSection(),
//               _buildNetflixTVSeriesSection(),
//               _buildNetflixNewReleasesSection(),
//
//               // Bottom padding for navigation bar
//               SizedBox(height: 100),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixTopNavigation() {
//     return Container(
//       height: 60,
//       padding: EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space10),
//       child: Row(
//         children: [
//           // Netflix Logo
//           Container(
//             width: 80,
//             height: 30,
//             child: AppText(
//               text: "NETFLIX",
//               color: MyColor.secondaryColor,
//               size: Dimensions.fontLarge,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           Spacer(),
//
//           // Tab Navigation
//           Row(
//             children: [
//               AppText(
//                 text: "1",//MyStrings.tvseries.tr,
//                 color: MyColor.colorWhite.withOpacity(0.7),
//                 size: Dimensions.fontMedium,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(width: Dimensions.space20),
//               AppText(
//                 text:"1",// MyStrings.movies.tr,
//                 color: MyColor.colorWhite,
//                 size: Dimensions.fontMedium,
//                 fontWeight: FontWeight.w600,
//               ),
//             ],
//           ),
//
//           Spacer(),
//
//           // Profile Avatar
//           Container(
//             width: 32,
//             height: 32,
//             decoration: BoxDecoration(
//               color: MyColor.secondaryColor,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(Icons.person, color: MyColor.colorWhite, size: 20),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNetflixHeroSection() {
//     return Container(
//       height: 500,
//       child: Stack(
//         children: [
//           // Background Image
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage('https://via.placeholder.com/400x500/1a1a1a/FFFFFF?text=HUNT'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // Netflix-style gradient overlay
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.transparent,
//                   Colors.black.withOpacity(0.3),
//                   Colors.black.withOpacity(0.8),
//                 ],
//                 stops: [0.0, 0.5, 1.0],
//               ),
//             ),
//           ),
//
//           // Content positioned at bottom like Netflix
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.all(Dimensions.space30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title
//                   AppText(
//                     text: "1",//MyStrings.hunt.tr,
//                     color: MyColor.colorWhite,
//                     size: 48,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(height: Dimensions.space10),
//
//                   // Subtitle
//                   AppText(
//                     text: "1",//MyStrings.huntapocalypse.tr,
//                     color: MyColor.colorWhite.withOpacity(0.9),
//                     size: Dimensions.fontLarge,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   SizedBox(height: Dimensions.space20),
//
//                   // Action Buttons
//                   Row(
//                     children: [
//                       // Play Button
//                       Container(
//                         height: 50,
//                         padding: EdgeInsets.symmetric(horizontal: 30),
//                         decoration: BoxDecoration(
//                           color: MyColor.colorWhite,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.play_arrow, color: MyColor.colorBlack, size: 24),
//                             SizedBox(width: 8),
//                             AppText(
//                               text:"1",// MyStrings.playnow.tr,
//                               color: MyColor.colorBlack,
//                               size: Dimensions.fontMedium,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: Dimensions.space15),
//
//                       // Info Button
//                       Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Icon(Icons.info_outline, color: MyColor.colorWhite, size: 24),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNetflixContinueWatchingSection() {
//     return _buildNetflixSection(
//       title: "1",//MyStrings.continuewatching.tr,
//       child: SizedBox(
//         height: 140,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: 5,
//           itemBuilder: (context, index) => Container(
//             width: 240,
//             margin: EdgeInsets.only(right: Dimensions.space10),
//             decoration: BoxDecoration(
//               color: Colors.grey[900],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 // Thumbnail
//                 Container(
//                   width: 80,
//                   height: 140,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       bottomLeft: Radius.circular(8),
//                     ),
//                     image: DecorationImage(
//                       image: NetworkImage('https://via.placeholder.com/80x140/333333/FFFFFF?text=${index + 1}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Center(
//                     child: Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.7),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.play_arrow, color: MyColor.colorWhite, size: 16),
//                     ),
//                   ),
//                 ),
//
//                 // Content
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all(Dimensions.space15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AppText(
//                           text: "The Power of Technology",
//                           color: MyColor.colorWhite,
//                           size: Dimensions.fontSmall,
//                           fontWeight: FontWeight.w600,
//                           maxLines: 2,
//                         ),
//                         SizedBox(height: Dimensions.space5),
//                         AppText(
//                           text: "00:23:13",
//                           color: MyColor.colorWhite.withOpacity(0.7),
//                           size: Dimensions.fontExtraSmall,
//                         ),
//                         SizedBox(height: Dimensions.space10),
//                         // Progress bar
//                         Container(
//                           height: 3,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[700],
//                             borderRadius: BorderRadius.circular(2),
//                           ),
//                           child: FractionallySizedBox(
//                             alignment: Alignment.centerLeft,
//                             widthFactor: 0.3, // 30% progress
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: MyColor.secondaryColor,
//                                 borderRadius: BorderRadius.circular(2),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixTrendingSection() {
//     return _buildNetflixSection(
//       title: "Trending Now",
//       child: SizedBox(
//         height: 200,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: 8,
//           itemBuilder: (context, index) => Container(
//             width: 140,
//             margin: EdgeInsets.only(right: Dimensions.space10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: NetworkImage('https://via.placeholder.com/140x200/333333/FFFFFF?text=Movie${index + 1}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixTop10Section() {
//     return _buildNetflixSection(
//       title: "1",//MyStrings.top10inyourcountry.tr,
//       child: SizedBox(
//         height: 200,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: 10,
//           itemBuilder: (context, index) => Container(
//             width: 140,
//             margin: EdgeInsets.only(right: Dimensions.space10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: NetworkImage('https://via.placeholder.com/140x200/1a1a1a/FFFFFF?text=${index + 1}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Number badge
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       color: MyColor.secondaryColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: AppText(
//                         text: "${index + 1}",
//                         color: MyColor.colorWhite,
//                         size: Dimensions.fontSmall,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixGenresSection() {
//     final genres = ["Action", "Comedy", "Drama", "Horror", "Sci-Fi", "Thriller"];
//
//     return _buildNetflixSection(
//       title: "Popular Genres",
//       child: SizedBox(
//         height: 60,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: genres.length,
//           itemBuilder: (context, index) => Container(
//             margin: EdgeInsets.only(right: Dimensions.space15),
//             padding: EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space10),
//             decoration: BoxDecoration(
//               color: Colors.grey[800],
//               borderRadius: BorderRadius.circular(25),
//               border: Border.all(color: Colors.grey[600]!, width: 1),
//             ),
//             child: Center(
//               child: AppText(
//                 text: genres[index],
//                 color: MyColor.colorWhite,
//                 size: Dimensions.fontSmall,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixTVSeriesSection() {
//     return _buildNetflixSection(
//       title: "1",//MyStrings.tvseriespickedforyou.tr,
//       child: SizedBox(
//         height: 200,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: 6,
//           itemBuilder: (context, index) => Container(
//             width: 160,
//             margin: EdgeInsets.only(right: Dimensions.space10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: NetworkImage('https://via.placeholder.com/160x200/2a2a2a/FFFFFF?text=Series${index + 1}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Episode badge
//                 if (index == 1)
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: MyColor.secondaryColor,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: AppText(
//                         text:"1",// MyStrings.episode1.tr,
//                         color: MyColor.colorWhite,
//                         size: Dimensions.fontExtraSmall,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//
//                 // Rating badge
//                 Positioned(
//                   bottom: 8,
//                   right: 8,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: MyColor.colorYellow,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: AppText(
//                       text: "${6.0 + (index * 0.2)}",
//                       color: MyColor.colorBlack,
//                       size: 8,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixNewReleasesSection() {
//     return _buildNetflixSection(
//       title: "New Releases",
//       child: SizedBox(
//         height: 200,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20),
//           itemCount: 7,
//           itemBuilder: (context, index) => Container(
//             width: 140,
//             margin: EdgeInsets.only(right: Dimensions.space10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: NetworkImage('https://via.placeholder.com/140x200/444444/FFFFFF?text=New${index + 1}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // New badge
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: AppText(
//                       text: "NEW",
//                       color: MyColor.colorWhite,
//                       size: 8,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetflixSection({required String title, required Widget child}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space15),
//           child: AppText(
//             text: title,
//             color: MyColor.colorWhite,
//             size: Dimensions.fontLarge,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         child,
//         SizedBox(height: Dimensions.space20),
//       ],
//     );
//   }
// }
