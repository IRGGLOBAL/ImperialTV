class FlightModel {
  final String fromCity;
  final String fromCode;
  final String toCity;
  final String toCode;
  final String departureTime;
  final String duration;
  final String flightNumber;
  final String price;

  FlightModel({
    required this.fromCity,
    required this.fromCode,
    required this.toCity,
    required this.toCode,
    required this.departureTime,
    required this.duration,
    required this.flightNumber,
    required this.price,
  });
}
