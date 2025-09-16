// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Utils/app_imports/app_imports.dart';
import '../Paddings/AppBorderRadius.dart';
import '../custom_widget/my_color.dart';
import 'AppText.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final double textSize;
  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final Color textColor;
  final Color iconColor;
  final FontWeight fontWeight;
  final BorderRadius buttonRadius;
  final IconData icon;
  final String iconImage;
  final bool isIcon;
  final bool isCenter;
  final double iconSize;
  final double iconWidth;
  final double iconHeight;
  final double paddingButton;
  final VoidCallback onTap;
  final double borderWidth;
  final Color borderColor;
  final String fontFamily;
  bool isSuffix = false;
  double elevation = 3.0;

  AppButton({
    Key? key,
    required this.buttonName,
    this.buttonWidth = 250,
    this.buttonHeight = 50,
    required this.buttonColor,
    required this.textColor,
    this.fontWeight = FontWeight.w500,
    this.buttonRadius = BorderRadius.zero,
    this.iconColor = Colors.white,
    this.icon = Icons.home,
    this.iconImage = "",
    this.isIcon = false,
    this.isCenter = false,
    this.iconSize = 25,
    this.iconWidth = 21,
    this.iconHeight = 14,
    this.paddingButton = 0,
    this.fontFamily = "Work Sans",
    required this.onTap,
    this.textSize = 18,
    this.borderWidth = 1,
    this.elevation = 3.0,
    this.isSuffix = false,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: MyColor.hintTextColor)
            ],
            borderRadius: buttonRadius == BorderRadius.zero
                ? AppBorderRadius.BORDER_RADIUS_10
                : buttonRadius,
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            )),
        child: CupertinoButton(
          borderRadius: buttonRadius == BorderRadius.zero
              ? AppBorderRadius.BORDER_RADIUS_10
              : buttonRadius,
          padding: EdgeInsets.zero,
          color: buttonColor,
          onPressed: onTap,
          child: Padding(
            padding: isCenter
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.only(left: paddingButton == 0 ? 0 : 15),
            child: Row(
              mainAxisAlignment: paddingButton == 0
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                !isSuffix
                    ? isIcon
                        ? iconImage == ""
                            ? Icon(
                                icon,
                                color: iconColor,
                                size: iconSize,
                              )
                            : Image.asset(
                                iconImage,
                                //color: iconColor,
                                height: iconSize,
                              )
                        : Container()
                    : Container(),
                isCenter
                    ? const Spacer()
                    : SizedBox(
                        width: paddingButton == 0
                            ? isIcon
                                ? 10
                                : 0
                            : paddingButton,
                      ),
                isSuffix
                    ? SizedBox(
                        width: Get.width * 0.6,
                        child: Center(
                          child: AppText(
                              text: buttonName,
                              color: textColor,
                              fontFamily: fontFamily,
                              fontWeight: fontWeight,
                              size: textSize),
                        ),
                      )
                    : Center(
                        child: AppText(
                            text: buttonName,
                            color: textColor,
                            fontFamily: fontFamily,
                            fontWeight: fontWeight,
                            size: textSize),
                      ),
                isCenter ? const Spacer() : Container(),
              ],
            ),
          ),
        ));
  }
}
