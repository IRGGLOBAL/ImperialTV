class DestinationModel {
  final String image;
  final String title;
  final String location;
  final String rating;
  final String discount;
  final String price;

  DestinationModel({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.discount,
    required this.price,
  });

  factory DestinationModel.fromMap(Map<String, dynamic> map) {
    return DestinationModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      rating: (map['rating'] ?? 0).toString(),
      discount: map['discount'] ?? '',
      price: map['price'] ?? '',
    );
  }
}
