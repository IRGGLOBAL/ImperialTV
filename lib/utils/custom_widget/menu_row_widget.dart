import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils.dart';
import 'dimensions.dart';
import 'my_color.dart';
import 'style.dart';

class MenuRowWidget extends StatelessWidget {
  final String image;
  final double? imageSize;
  final Color? imgColor;
  final Color? textColor;
  final String label;
  final String? counter;
  final bool counterEnabled;
  final VoidCallback onPressed;
  final Widget? endWidget;

  const MenuRowWidget({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
    this.counter,
    this.counterEnabled = false,
    this.imageSize = 24,
    this.endWidget,
    this.imgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(Dimensions.space20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],),
        padding: const EdgeInsetsDirectional.symmetric(
            vertical: Dimensions.space20, horizontal: Dimensions.space12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  image.contains('svg')
                      ? SvgPicture.asset(
                    image,
                    colorFilter: ColorFilter.mode(
                        imgColor ?? MyColor.primaryColor,
                        BlendMode.srcIn),
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.contain,
                  )
                      : Image.asset(
                    image,
                    color: imgColor ?? MyColor.secondaryColor,
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: Dimensions.space15),
                  Expanded(
                    child: Text(
                      label.tr,
                      style: mediumDefault.copyWith(
                          color: textColor ?? MyColor.getTextColor()),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (counterEnabled == true && counter != '0')
              Container(
                decoration: BoxDecoration(
                    color: MyColor.colorRed,
                    borderRadius: BorderRadius.circular(Dimensions.space2)),
                padding:
                const EdgeInsets.symmetric(horizontal: Dimensions.space5),
                child: Text(
                  "$counter",
                  style: regularDefault.copyWith(
                    color: MyColor.colorWhite,
                  ),
                ),
              )
            else
              endWidget ??
                  Icon(Icons.arrow_forward_ios_rounded,
                      color: MyColor.buttonbackgroun, size: 15)
          ],
        ),
      ),
    );
  }
}
