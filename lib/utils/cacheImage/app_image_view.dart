import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../Utils/app_imports/app_imports.dart';
import '../Paddings/AppBorderRadius.dart';
import '../Widgets/helper_functions.dart';
import '../constants/app_images.dart';
import '../custom_widget/my_color.dart';
import '../loader/app_loader.dart';

class AppImageView extends StatelessWidget {
  final String imageUrl;
  var height = Get.height / 13;
  var width = Get.width / 4.7;

  AppImageView({
    Key? key,
    required this.imageUrl,
    this.height = 40,
    this.width = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.BORDER_RADIUS_10,
      child: Image.network(
        imageUrl,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          print(exception);
          return Image.asset(
            AppImages.logo,
            width: width,
            fit: BoxFit.cover,
            height: height,
          );
        },
        width: width,
        fit: BoxFit.cover,
        height: height,
      ),
    );
  }
}

class AppCacheImageView extends StatelessWidget {
  AppCacheImageView(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.borderRadius = 10,
      this.isProfile = false})
      : super(key: key);

  final String imageUrl;
  double width = Get.width * .3;
  double height = Get.height * .3;
  double borderRadius = 10;
  bool isProfile = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: isProfile ? BoxFit.cover : BoxFit.cover,
        imageUrl: imageUrl.contains('http')
            ? imageUrl
            : HelperFunctions.getImageUrl(imageUrl),
        // imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Container(
            margin: const EdgeInsets.all(2),
            child: customLoader(
              MyColor.primaryColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          isProfile ? Icons.cloud_upload_rounded : Icons.broken_image_sharp,
          size: 60,
        ),
        //     Image.asset(
        //   AppImages.logo,
        //   color: AppColors.PRIMARY_COLOR,
        //   fit: isProfile ? BoxFit.cover : BoxFit.contain,
        //   height: height,
        //   width: width,
        // ),
      ),
    );
  }
}

class AppProfileCacheImageView extends StatelessWidget {
  AppProfileCacheImageView({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 100,
  }) : super(key: key);

  final String imageUrl;
  double width = Get.width * .3;
  double height = Get.height * .3;
  double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        // height: AppConfig(context).height * .04,
        height: height,

        width: width,
        fit: BoxFit.cover,
        imageUrl: imageUrl.contains('http')
            ? imageUrl
            : HelperFunctions.getImageUrl(imageUrl),
        // imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Container(
            // width: 25,
            // height: 15,
            margin: const EdgeInsets.all(2),
            child: customLoader(
              MyColor.primaryColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImages.logo,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

Widget customImage(
    {required String imageUrl,
    bool isProfile = true,
    double radius = 10,
    var width = 50.0,
    var height = 70.0,
    Color? color,
    Color? borderColor,
    BoxFit fit = BoxFit.cover}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.file(
          File(
            imageUrl,
          ),
          errorBuilder: (context, error, stackTrace) {
            return customLoader(MyColor.primaryColor);
          },
          fit: BoxFit.cover,
        )),
  );
}
