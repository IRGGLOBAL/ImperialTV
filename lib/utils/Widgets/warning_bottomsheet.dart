import '../../Utils/app_imports/app_imports.dart';
import '../Fonts/AppDimensions.dart';
import '../Paddings/AppBorderRadius.dart';
import '../custom_widget/my_color.dart';
import 'AppButton.dart';
import 'AppText.dart';

Widget warningBottomSheet(
    {String title = 'Are you sure you want to logout?',
    String des = '',
    VoidCallback? cancelTap,
    VoidCallback? confirmTap,
    bool isDescription = false}) {
  return SafeArea(
    top: false,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.BORDER_RADIUS_12,
        color: MyColor.colorWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 3,
                width: 50,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: AppBorderRadius.BORDER_RADIUS_05),
              ),
            ),
            vSizedBox(),
            AppText(
                text: title,
                fontWeight: FontWeight.w600,
                size: AppDimensions.FONT_SIZE_20,
                textAlign: TextAlign.center),
            isDescription
                ? AppText(
                    text: des,
                    fontWeight: FontWeight.w400,
                    size: AppDimensions.FONT_SIZE_16,
                    // textAlign: TextAlign.center
                  )
                : const SizedBox.shrink(),
            vSizedBox(),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                        buttonName: 'Yes',
                        buttonColor: MyColor.colorWhite,
                        textColor: MyColor.colorBlack,
                        borderColor:MyColor.getGreyColor(),
                        onTap: confirmTap!)),
                hSizedBox(),
                Expanded(
                    child: AppButton(
                        buttonName: 'Cancel',
                        buttonColor: MyColor.primaryColor,
                        textColor:MyColor.colorWhite,
                        onTap: cancelTap!)),
              ],
            ),
            // vSizedBox(height: Get.height * 0.04)
          ],
        ),
      ),
    ),
  );
}
