import 'package:get/get.dart';
import 'package:imperialtv/app_module/settings/subscription_details_view.dart';

import '../../Utils/app_imports/app_imports.dart';

enum DownloadStatus { downloading, finished, failed }

class DownloadItem {
  String title;
  String subtitle;
  double progress;
  DownloadStatus status;
  bool isPaused;

  DownloadItem({
    required this.title,
    required this.subtitle,
    required this.progress,
    this.status = DownloadStatus.downloading,
    this.isPaused = false,
  });
}

class DownloadController extends GetxController {

  var selectedMode = "automatic".obs;
  var selectedTab = 0.obs;
  var downloads = <DownloadItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    downloads.value = [
      DownloadItem(
        title: "The Rainmaker",
        subtitle: "1 Hour 30 Min | Romance",
        progress: 0.40,
        status: DownloadStatus.downloading,
      ),
      DownloadItem(
        title: "The Summit",
        subtitle: "1 Hour 30 Min | Romance",
        progress: 1.0,
        status: DownloadStatus.finished,
      ),
      DownloadItem(
        title: "Jewel in the Palace",
        subtitle: "1 Hour 30 Min | Romance",
        progress: 0.78,
        status: DownloadStatus.downloading,
      ),
      DownloadItem(
        title: "Sweet Dreams",
        subtitle: "1 Hour 30 Min | Romance",
        progress: 0.12,
        status: DownloadStatus.failed,
      ),
      DownloadItem(
        title: "The Wildest Dream",
        subtitle: "1 Hour 30 Min | Romance",
        progress: 0.50,
        status: DownloadStatus.downloading,
      ),
    ];
  }

  List<DownloadItem> get filteredDownloads {
    switch (selectedTab.value) {
      case 1:
        return downloads.where((d) => d.status == DownloadStatus.finished).toList();
      case 2:
        return downloads.where((d) => d.status == DownloadStatus.failed).toList();
      default:
        return downloads;
    }
  }

  void changeMode(String mode) {
    selectedMode.value = mode;
  }


  void selectTab(int index) {
    selectedTab.value = index;
  }

  void togglePause(DownloadItem item) {
    item.isPaused = !item.isPaused;
    downloads.refresh(); // Force UI update
    final text = item.isPaused ? "Paused" : "Resumed";
    Get.snackbar("Download", "$text: ${item.title}");
  }

  void cancelItem(DownloadItem item) async {
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: const Text("Cancel download?"),
        content: Text("Are you sure you want to cancel \"${item.title}\"?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      downloads.remove(item);
      Get.snackbar("Download", "Cancelled: ${item.title}");
    }
  }

  void playItem(DownloadItem item) {
    item.progress = 1.0;
    item.status = DownloadStatus.finished;
    item.isPaused = false;
    downloads.refresh();

    Get.snackbar("Playing", "Now playing: ${item.title}");
  }

  void retryItem(DownloadItem item) {
    item.status = DownloadStatus.downloading;
    item.progress = 0.05;
    item.isPaused = false;
    downloads.refresh();

    Get.snackbar("Download", "Retrying: ${item.title}");
  }

  /// Subscription
  var selectedIndex = 1.obs; // Default "Standard" selected

  final plans = [
    {
      "name": "Basic",
      "price": "\$42.99",
      "period": "/ Month",
      "desc": "Billed monthly no trial"
    },
    {
      "name": "Standard",
      "price": "\$52.99",
      "period": "/ Month",
      "desc": "Billed monthly no trial"
    },
    {
      "name": "Premium",
      "price": "\$62.99",
      "period": "/ Month",
      "desc": "Billed monthly no trial"
    },
  ];

  void selectPlan(int index) {
    selectedIndex.value = index;
  }
  void proceedToSubscription() {
    final selectedPlan = plans[selectedIndex.value];
    // Navigate to details screen
    Get.to(() => SubscriptionDetailsView());
    Get.snackbar(
        "Subscription",
        "Proceeding with ${selectedPlan["name"]} plan"
    );
  }

  // void proceedToSubscription() {
  //   final selectedPlan = plans[selectedIndex.value];
  //   // Handle subscription logic
  //   Get.snackbar(
  //       "Subscription",
  //       "Proceeding with ${selectedPlan["name"]} plan"
  //   );
  //   // Add your actual subscription logic here
  // }
}