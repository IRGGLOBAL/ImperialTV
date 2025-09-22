import 'package:get/get.dart';

class SearchController extends GetxController {
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
      "poster": "assets/images/hunt.png",
    },
    {
      "title": "The Lost City",
      "year": "2022",
      "rating": "13+",
      "genre": "Thriller - Horror - Murder",
      "poster": "assets/images/lostcity.png",
    },
    {
      "title": "Venom",
      "year": "2022",
      "rating": "17+",
      "genre": "Thriller - Horror - Murder",
      "poster": "assets/images/venom.png",
    },
  ].obs;
}
