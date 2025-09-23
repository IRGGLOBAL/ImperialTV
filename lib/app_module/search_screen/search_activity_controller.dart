import 'package:get/get.dart';
import 'package:imperialtv/utils/Images/my_images.dart';

class SearchActivityController extends GetxController {
  var recentSearches = [
    "Captain Larvem",
    "Final Vacation",
    "Bromance Story",
  ].obs;

  var trendingSearches = [
    {
      "title": "Hunt - apocalypse",
      "year": "2022",
      "rating": "21+",
      "genre": "Thriller - Horror - Murder",
      "poster":MyImages.topbanner,
    },
    {
      "title": "The Lost City",
      "year": "2022",
      "rating": "13+",
      "genre": "Thriller - Horror - Murder",
      "poster": MyImages.topbannertwo,
    },
    {
      "title": "Venom",
      "year": "2022",
      "rating": "17+",
      "genre": "Thriller - Horror - Murder",
      "poster": MyImages.topbannerthree,
    },
  ].obs;
}
