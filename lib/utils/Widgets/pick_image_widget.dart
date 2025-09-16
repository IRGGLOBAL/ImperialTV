import 'package:get/get.dart';
import '../../Utils/app_imports/app_imports.dart';
import '../Paddings/AppBorderRadius.dart';
import '../custom_widget/my_color.dart';
import 'AppText.dart';

Widget pickImageWidget({
  VoidCallback? onCameraTap,
  VoidCallback? onGalleryTap,
}) {
  return SafeArea(
    top: false,
    child: Container(
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: 'Choose one',
              size: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: onGalleryTap,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.BORDER_RADIUS_10,
                          color: MyColor.primaryColor.withOpacity(.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.folder_copy_rounded,
                            color: MyColor.primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      // AppText(
                      //     text: "Gallery",
                      //     size: 16,
                      //     fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onCameraTap,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.BORDER_RADIUS_10,
                          color: MyColor.primaryColor.withOpacity(.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.photo_camera,
                            color: MyColor.primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      // AppText(
                      //     text: 'Camera',
                      //     size: 16,
                      //     fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
