final class Hotel {
  String name;
  String image;
  String adress;
  double rating;
  int id;
  Hotel(
      {required this.name,
      required this.image,
      required this.adress,
      required this.rating,
      required this.id});

  factory Hotel.fromJson(Map<dynamic, dynamic> json) {
    return Hotel(
        name: json["HOTEL_NAME"],
        image: json["HOTEL_IMAGE"],
        adress: json["HOTEL_ADRESS"],
        rating: json["HOTEL_RATING"],
        id: json["HOTEL_ID"]);
  }
}
