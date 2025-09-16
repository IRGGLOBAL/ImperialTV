class AdModel {
  final String title;
  final String discountValue;
  final String discountLabel;
  final String buttonText;
  final String imageUrl;

  AdModel({
    required this.title,
    required this.discountValue,
    required this.discountLabel,
    required this.buttonText,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'discountValue': discountValue,
      'discountLabel': discountLabel,
      'buttonText': buttonText,
      'imageUrl': imageUrl,
    };
  }

  factory AdModel.fromMap(Map<String, dynamic> map) {
    return AdModel(
      title: map['title'] ?? '',
      discountValue: map['discountValue'] ?? '',
      discountLabel: map['discountLabel'] ?? '',
      buttonText: map['buttonText'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

}
