class TopPicItemModels {
  final int id;
  final String location;
  final String title;
  final String rating;
  final String imageUrl;

  TopPicItemModels({
    required this.id,
    required this.location,
    required this.title,
    required this.rating,
    required this.imageUrl,


  });

  factory TopPicItemModels.fromMap(Map<String, dynamic> map) {
    return TopPicItemModels(
      id: map['id'] ?? 0,
      location: map['location'] ?? '',
      title: map['title'] ?? '',
      rating: (map['rating'] ?? 0).toDouble(),
      //rating: map['rating']?.toString() ?? '0.0',
      imageUrl: map['imageUrl'] ?? '',

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location': location,
      'title': title,
      'rating': rating,
    };
  }
}
