class TopPicItemModelforyou {
  final int id;
  final String title;
  final String location;
  final String rating;
  final String imageUrl;

  TopPicItemModelforyou({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  factory TopPicItemModelforyou.fromMap(Map<String, dynamic> map) {
    return TopPicItemModelforyou(
      id: int.tryParse(map['id'] ?? "0")??0,
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      rating: (map['rating'] ?? 0).toString(),
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
