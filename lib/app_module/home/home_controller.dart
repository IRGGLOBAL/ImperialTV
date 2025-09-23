import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../data/models/ad_model.dart';
import '../../data/models/destination_model.dart';
import '../../data/models/top_pic.dart';
import '../../data/models/top_pic_for_you.dart';

class HomeController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var searchHintText = "Search...".tr.obs;
  var isListening = false.obs;
  final stt.SpeechToText _speech = stt.SpeechToText();


  void toggleListening() async {
    if (isListening.value) {
      await _speech.stop();
      isListening.value = false;
    } else {
      bool available = await _speech.initialize();
      if (available) {
        isListening.value = true;
        _speech.listen(onResult: (result) {
          searchHintText.value = result.recognizedWords;
          searchController.text = result.recognizedWords;
        });
      }
    }
  }



  // Map to store favorite status by item ID
  RxMap<int, bool> favoriteMap = <int, bool>{}.obs;

  // Toggle favorite status for a given item ID
  void toggleFavorite(int id) {
    favoriteMap[id] = !(favoriteMap[id] ?? false);
  }

  // Getter to check if item is favorite
  bool isFavorite(int id) {
    return favoriteMap[id] ?? false;
  }


  @override
  void onInit() {
    fetchAds();
    fetchTopPick();
    fetchDestinations();
    fetchTopPicks();
    super.onInit();
  }
/// the card appears right after search
  RxList<AdModel> adsList = <AdModel>[].obs;
  Future<void> fetchAds() async {
    print('Fetching ads from Firestore...');
    try {
      final snapshot = await FirebaseFirestore.instance.collection('musafarehome').get();
      print('Fetched documents count: ${snapshot.docs.length}');

      for (var doc in snapshot.docs) {
        print('Document Data: ${doc.data()}');
      }

      adsList.value =
          snapshot.docs.map((doc) => AdModel.fromMap(doc.data())).toList();
      filteredadsList.assignAll(adsList);

      print('adsList updated with ${adsList.length} items');
    } catch (e) {
      print('Error fetching ads: $e');
    }
  }

/// Search screen part
  RxList<TopPicItemModels> topPicks = <TopPicItemModels>[].obs;
  Future<void> fetchTopPicks() async {
    final snapshot = await FirebaseFirestore.instance.collection('topPicks').get();
    final items = snapshot.docs.map((doc) => TopPicItemModelforyou.fromMap(doc.data())).toList();

    topPicksforyou.assignAll(items);
    filteredItems.assignAll(items);

  }

  Future<void> refreshHomeData() async {
    try {
      // Call your actual data-fetching methods here
      await fetchAds();
      await fetchTopPicks();
      // Add other refresh logic if needed
    } catch (e) {
      print("Error refreshing home data: $e");
    }
  }


  /// Top Pic For You Card
  RxList<TopPicItemModelforyou> topPicksforyou = <TopPicItemModelforyou>[].obs;
  Future<void> fetchTopPick() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('topPicks').get();
      topPicksforyou.value = snapshot.docs
          .map((doc) => TopPicItemModelforyou.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print("Error fetching top picks: $e");
    }
  }

  /// More Pic For You Card
  RxList<DestinationModel> destinationList = <DestinationModel>[].obs;
  Future<void> fetchDestinations() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('destinations').get();
      destinationList.value = snapshot.docs
          .map((doc) => DestinationModel.fromMap(doc.data()))
          .toList();
      filteredestination.assignAll(destinationList);
    } catch (e) {
      print("Error fetching destinations: $e");
    }
  }



  /// Variables for search
  RxList<TopPicItemModelforyou> filteredItems = <TopPicItemModelforyou>[].obs;
  RxList<DestinationModel> filteredestination = <DestinationModel>[].obs;
  RxList<AdModel> filteredadsList = <AdModel>[].obs;

  void filterByLocation(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(topPicksforyou);
      filteredadsList.assignAll(adsList);
      filteredestination.assignAll(destinationList);

    } else {
      filteredItems.assignAll(
        topPicksforyou.where((item) =>
            item.location.toLowerCase().contains(query.toLowerCase())),
      );
      filteredadsList.assignAll(
        adsList.where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase())),
      );
      filteredestination.assignAll(
        destinationList.where((item) =>
            item.location.toLowerCase().contains(query.toLowerCase())),
      );

    }
  }

  ///home

  final PageController pageController = PageController();
  final currentPage = 0.obs; // Observable variable

  void changePage(int index) {
    currentPage.value = index;
  }

  ///Movie detail

  var selectedTab = 0.obs;
  var isSynopsisExpanded = false.obs; // Add this line

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void toggleSynopsis() { // Add this method
    isSynopsisExpanded.value = !isSynopsisExpanded.value;
  }

}