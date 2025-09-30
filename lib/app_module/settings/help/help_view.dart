import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imperialtv/app_module/settings/help/email_us_view.dart';
import 'package:imperialtv/app_module/settings/help/speak_with_a_representation_view.dart';
import 'package:imperialtv/utils/text_strings.dart';
import '../../../utils/Fonts/AppDimensions.dart';
import '../../../utils/Widgets/AppText.dart';
import '../../../utils/custom_widget/my_color.dart';
import 'help_details_view.dart';

class HelpView extends StatelessWidget {
  HelpView({Key? key}) : super(key: key);

  final List<String> helpTitles = [
    MyStrings.changingtheimperialtvapplanguage.tr,
    MyStrings.cancelmyimperialtvappsubscription.tr,
    MyStrings.installimperialtvonyourdevices.tr,
    MyStrings.maturityratings.tr,
    MyStrings.parentalcontrolsonimperialtv.tr,
    MyStrings.watchimperialtvonchromecast.tr,
    MyStrings.howdoicastimperialtvtomytv.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: MyColor.colorBlack,
        surfaceTintColor: MyColor.transparentColor,
        title: AppText(
          text: MyStrings.help.tr,
          size: AppDimensions.FONT_SIZE_16,
          fontWeight: FontWeight.w600,
          color: MyColor.colorWhite,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// List of Help Options
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    ...helpTitles.asMap().entries.map(
                          (entry) {
                        int index = entry.key;
                        String title = entry.value;
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => HelpDetailsView(index: index));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: title,
                                      size: AppDimensions.FONT_SIZE_12,
                                      fontWeight: FontWeight.w600,
                                      color: MyColor.primaryColor,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: MyColor.primaryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Contact Us Section
              AppText(
                text: MyStrings.contactus.tr,
                size: AppDimensions.FONT_SIZE_16,
                fontWeight: FontWeight.w600,
                color: MyColor.colorWhite,
              ),
              const SizedBox(height: 12),

              _contactCard(
                context,
                icon: Icons.phone,
                iconColor: Colors.red,
                title: MyStrings.speakwitharepresentative.tr,
                subtitle: MyStrings.providecontactinformationsowe.tr,
                onTap: () {
                  Get.to(() => SpeakWithARepresentationView());
                },
              ),
              const SizedBox(height: 12),
              _contactCard(
                context,
                icon: Icons.email,
                iconColor: Colors.red,
                title: MyStrings.emailus.tr,
                subtitle: MyStrings.tellusalittleaboutyour.tr,
                onTap: () {
                  Get.to(() => EmailUsView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactCard(
      BuildContext context, {
        required IconData icon,
        required Color iconColor,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColor.colorWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    size: AppDimensions.FONT_SIZE_14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    text: subtitle,
                    size: AppDimensions.FONT_SIZE_12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.chevron_right,
              color: MyColor.primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:imperialtv/app_module/settings/help/email_us_view.dart';
// import 'package:imperialtv/app_module/settings/help/speak_with_a_representation_view.dart';
// import 'package:imperialtv/utils/text_strings.dart';
// import '../../../utils/Fonts/AppDimensions.dart';
// import '../../../utils/Widgets/AppText.dart';
// import '../../../utils/custom_widget/my_color.dart';
// import 'help_details_view.dart';
//
// class HelpView extends StatelessWidget {
//   HelpView({Key? key}) : super(key: key);
//
//   final List<Map<String, dynamic>> helpOptions = [
//
//     {
//       "title": MyStrings.changingtheimperialtvapplanguage.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         Get.snackbar("Tapped", "Go to Language Settings");
//       },
//     },
//     {
//       "title": MyStrings.cancelmyimperialtvappsubscription.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//     {
//       "title": MyStrings.installimperialtvonyourdevices.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//     {
//       "title": MyStrings.maturityratings.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//     {
//       "title": MyStrings.parentalcontrolsonimperialtv.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//     {
//       "title": MyStrings.watchimperialtvonchromecast.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//     {
//       "title": MyStrings.howdoicastimperialtvtomytv.tr,
//       "onTap": () {
//         Get.to(() => HelpDetailsView());
//         },
//     },
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: MyColor.colorBlack,
//         surfaceTintColor: MyColor.transparentColor,
//         title: AppText(
//           text: MyStrings.help.tr,
//           size: AppDimensions.FONT_SIZE_16,
//           fontWeight: FontWeight.w600,
//           color: MyColor.colorWhite,
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: MyColor.colorWhite),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               /// List of Help Options
//           Container(
//             padding: const EdgeInsets.symmetric(
//               vertical: 5, // reduce vertical padding here
//             ),
//           decoration: BoxDecoration(
//           color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Column(
//             children: [
//               ...helpOptions.map(
//                     (item) => Column(
//                   children: [
//                     InkWell(
//                       onTap: item["onTap"],
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 12, // reduce vertical padding here
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             AppText(
//                               text: item["title"],
//                               size: AppDimensions.FONT_SIZE_12,
//                               fontWeight: FontWeight.w600,
//                               color: MyColor.primaryColor,
//                             ),
//                             Icon(
//                               Icons.chevron_right,
//                               color: MyColor.primaryColor,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//           const SizedBox(height: 24),
//
//               /// Contact Us Section
//               AppText(
//                 text: MyStrings.contactus.tr,
//                 size: AppDimensions.FONT_SIZE_16,
//                 fontWeight: FontWeight.w600,
//                 color: MyColor.colorWhite,
//               ),
//               const SizedBox(height: 12),
//
//               _contactCard(
//                 context,
//                 icon: Icons.phone,
//                 iconColor: Colors.red,
//                 title: MyStrings.speakwitharepresentative.tr,
//                 subtitle:
//                 MyStrings.providecontactinformationsowe.tr,
//                 onTap: () {
//                   Get.to(()=>SpeakWithARepresentationView());
//                 },
//               ),
//               const SizedBox(height: 12),
//               _contactCard(
//                 context,
//                 icon: Icons.email,
//                 iconColor: Colors.red,
//                 title: MyStrings.emailus.tr,
//                 subtitle: MyStrings.tellusalittleaboutyour.tr,
//                 onTap: () {
//                   Get.to(()=> EmailUsView());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _contactCard(
//       BuildContext context, {
//         required IconData icon,
//         required Color iconColor,
//         required String title,
//         required String subtitle,
//         required VoidCallback onTap,
//       }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: MyColor.colorWhite,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(icon, color: iconColor, size: 28),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     text: title,
//                     size: AppDimensions.FONT_SIZE_14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(height: 2),
//                   AppText(
//                     text: subtitle,
//                     size: AppDimensions.FONT_SIZE_12,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 5),
//             Icon(
//               Icons.chevron_right,
//               color: MyColor.primaryColor,
//               size: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
