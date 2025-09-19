// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
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
  final bool hasShadow;
  final bool applyColorToSvg;

  AppButton({
    Key? key,
    required this.buttonName,
    this.buttonWidth = double.infinity,
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
    this.paddingButton = 8, // Default padding between icon and text
    this.fontFamily = "Work Sans",
    required this.onTap,
    this.textSize = 18,
    this.borderWidth = 1,
    this.elevation = 3.0,
    this.isSuffix = false,
    this.hasShadow = false,
    this.applyColorToSvg = false,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        color: buttonColor,
        boxShadow: hasShadow ? [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 4,
              color: MyColor.hintTextColor
          )
        ] : null,
        borderRadius: buttonRadius == BorderRadius.zero
            ? AppBorderRadius.BORDER_RADIUS_10
            : buttonRadius,
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: CupertinoButton(
        borderRadius: buttonRadius == BorderRadius.zero
            ? AppBorderRadius.BORDER_RADIUS_10
            : buttonRadius,
        padding: EdgeInsets.zero,
        color: buttonColor,
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isIcon && !isSuffix) // Icon on left
                iconImage.isEmpty
                    ? Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                )
                    : SvgPicture.asset(
                  iconImage,
                  height: iconSize,
                  width: iconSize,
                  color: applyColorToSvg ? iconColor : null, // Only apply color if explicitly requested
                ),

              if (isIcon && !isSuffix) // Space after left icon
                SizedBox(width: paddingButton),

              // Text
              AppText(
                text: buttonName,
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                size: textSize,
              ),

              if (isIcon && isSuffix) // Space before right icon
                SizedBox(width: paddingButton),

              if (isIcon && isSuffix) // Icon on right
                iconImage.isEmpty
                    ? Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                )
                    : SvgPicture.asset(
                  iconImage,
                  height: iconSize,
                  width: iconSize,
                  color: applyColorToSvg ? iconColor : null, // Only apply color if explicitly requested
                ),
            ],
          ),
        ),
      ),
    );
  }
}


