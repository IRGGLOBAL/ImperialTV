// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Fonts/AppDimensions.dart';
import '../Paddings/AppPaddings.dart';
import '../custom_widget/my_color.dart';
import 'AppText.dart';

class PrimaryAppBar extends StatelessWidget {
  final Color appbarColor;
  final bool isSubTitle;
  final bool isPrefix;
  final String titleFontFamily;
  final String subTitleFontFamily;
  final bool isDrop;
  final Widget suffix;
  final bool isOnSubTitle;
  final bool isSuffix;
  final String subTitle;
  final VoidCallback? dropOnTap;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final Color prefixButtonColor;
  final Color suffixButtonColor;
  final Color dropDownIconColor;
  final String suffixIconImage;
  final String prefixIconImage;
  final String titleText;
  final bool isCenter;
  final double titleSize;
  final double suffixPadding;
  final double prefixPadding;
  double subtitleSize;
  final Color titleColor;
  final Color subtitleColor;
  List<Widget> actions;
  final bool isActions;
  final FontWeight titleFontWeight;
  final FontWeight subtitleFontWeight;
  final VoidCallback? prefixOnTap;
  final VoidCallback? suffixOnTap;
  final bool isDivider;
  final double prefixIconHeight;
  final double prefixIconWidth;
  final double suffixIconHeight;
  final double suffixIconWidth;

  PrimaryAppBar({
    Key? key,
    this.suffixIconImage = "assets/icons/info.png",
    this.prefixIconImage = "assets/icons/back.png",
    required this.titleText,
    this.prefixOnTap,
    this.suffix = const SizedBox(),
    this.suffixOnTap,
    this.prefixIconColor = Colors.black,
    this.suffixIconColor = Colors.black,
    this.isSubTitle = false,
    this.isDrop = false,
    this.subTitle = "",
    this.actions = const [],
    this.isActions = false,
    this.dropOnTap,
    this.isSuffix = true,
    this.isPrefix = true,
    this.titleSize = 20,
    this.subtitleSize = 18,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.grey,
    this.titleFontWeight = FontWeight.w600,
    this.subtitleFontWeight = FontWeight.w400,
    this.prefixButtonColor = Colors.black,
    this.suffixButtonColor = const Color(0xffE5E5E5),
    this.dropDownIconColor = const Color(0xffE5E5E5),
    this.isDivider = false,
    this.isCenter = false,
    this.titleFontFamily = "Nunito",
    this.subTitleFontFamily = "Nunito",
    this.isOnSubTitle = false,
    this.suffixPadding = 5,
    this.prefixPadding = 5,
    this.prefixIconHeight = 18,
    this.prefixIconWidth = 20,
    this.suffixIconHeight = 22,
    this.suffixIconWidth = 22,
    this.appbarColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appbarColor, boxShadow: [
        BoxShadow(
            color:MyColor.colorGrey.withOpacity(.5),
            spreadRadius: 5,
            blurRadius: 5)
      ]),
      // height: Get.height / 8.14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          vSizedBox(height: Get.height * 0.05),
          Padding(
            padding: AppPaddings.defaultPadding,
            child: Row(
              children: [
                isPrefix
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back_ios_new_rounded,
                                  size: 18, color: prefixButtonColor),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : Container(
                        width: 10,
                      ),
                isCenter ? Spacer() : Container(),
                isSubTitle
                    ? GestureDetector(
                        onTap: dropOnTap ?? () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: dropOnTap ?? () {},
                              child: Row(
                                children: [
                                  AppText(
                                      fontFamily: titleFontFamily,
                                      text: titleText,
                                      size: titleSize,
                                      color: titleColor,
                                      fontWeight: titleFontWeight),
                                  isOnSubTitle
                                      ? Container()
                                      : Row(
                                          children: [
                                            SizedBox(width: 100),
                                            Image(
                                              height:
                                                  AppDimensions.FONT_SIZE_15,
                                              color: dropDownIconColor,
                                              image: AssetImage(
                                                'assets/icons/down_arrow.png',
                                              ),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                            // verticalSizedBox(context: context, height: 200),
                            Row(
                              children: [
                                AppText(
                                    fontFamily: subTitleFontFamily,
                                    text: subTitle,
                                    size: subtitleSize,
                                    color: subtitleColor,
                                    fontWeight: subtitleFontWeight),
                                isOnSubTitle
                                    ? Row(
                                        children: [
                                          SizedBox(width: 100),
                                          Image(
                                            height: AppDimensions.FONT_SIZE_15,
                                            color: dropDownIconColor,
                                            image: AssetImage(
                                              'assets/icons/down_arrow.png',
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: AppText(
                            fontFamily: titleFontFamily,
                            text: titleText,
                            size: titleSize,
                            color: titleColor,
                            fontWeight: titleFontWeight),
                      ),
                const Spacer(),
                isSuffix
                    ? suffix
                    /*AppCircleImageButton(
                        imageUrl: suffixIconImage,
                        onTap: suffixOnTap ?? () {},
                        iconColor: suffixIconColor,
                        padding: suffixPadding,
                        buttonColor: suffixButtonColor,
                        height: suffixIconHeight,
                        width: suffixIconWidth,
                      )*/
                    : isActions
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: actions,
                          )
                        : Container(
                            width: 40,
                          ),
              ],
            ),
          ),
          isDivider
              ? const Divider(
                  height: 0,
                )
              : Container()
        ],
      ),
    );
  }
}

class AppCircleImageButton extends StatelessWidget {
  final Color iconColor;
  final Color buttonColor;
  final double height;
  final double width;
  final double padding;
  final String imageUrl;
  final VoidCallback onTap;

  const AppCircleImageButton(
      {Key? key,
      this.buttonColor = const Color(0xffE5E5E5),
      this.height = 36,
      this.width = 36,
      required this.imageUrl,
      required this.onTap,
      required this.iconColor,
      this.padding = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle),
        child: Padding(
            padding: EdgeInsets.all(padding),
            child: Image(
              image: AssetImage(imageUrl),
              color: iconColor,
            )),
      ),
    );
  }
}
