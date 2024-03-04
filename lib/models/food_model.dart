final class Food {
  int id;
  String name;
  String type;
  String catogery;
  String rating;
  int price;
  int hotelId;
  String foodImage;
  bool isAddedFood = false;
  int count = 1;
  Food(
      {required this.id,
      required this.name,
      required this.type,
      required this.catogery,
      required this.rating,
      required this.price,
      required this.hotelId,
      required this.foodImage});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["FOOD_ID"],
      name: json["FOOD_NAME"],
      type: json["FOOD_TYPE"],
      catogery: json["FOOD_CATOGERY"],
      rating: json["FOOD_RATING"].toString(),
      price: json["FOOD_PRICE"],
      hotelId: json["HOTEL_ID"],
      foodImage: json["FOOD_IMAGE"],
    );
  }
}


