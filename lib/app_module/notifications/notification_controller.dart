import 'package:get/get.dart';
import 'package:imperialtv/utils/Images/my_images.dart';
import '../../data/models/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    notifications.addAll([
      NotificationModel(
        title: "Last call to watch",
        subtitle: "Time’s (almost) up on these",
        timeOrDate: "6:11 PM",
        svg: MyImages.topbanner, // ✅ make sure file exists
        isUnread: true,
      ),
      NotificationModel(
        title: "Now Available",
        subtitle: "Season 3",
        timeOrDate: "Sep 28",
        svg:MyImages.topbannerthree,
        isUnread: true,
      ),
      NotificationModel(
        title: "Netflix Lookahead",
        subtitle: "Explore what’s coming soon.",
        timeOrDate: "Sep 27",
        svg: MyImages.topbannerthree,
        isUnread: true,
      ),
      NotificationModel(
        title: "Don’t miss out",
        subtitle: "Experience more Black Rabbit",
        timeOrDate: "Sep 25",
        svg: MyImages.topbannertwo,
        isUnread: true,
      ),
    ]);
  }
}
