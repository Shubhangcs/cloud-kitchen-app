class Cart {
  int totalprice;
  int quantity;
  int userid;
  int foodid;
  int orderid;
  String foodname;
  String foodtype;
  String catogery;
  double rating;
  int foodprice;
  String image;
  String hotelname;

  Cart({
    required this.totalprice,
    required this.quantity,
    required this.userid,
    required this.catogery,
    required this.foodid,
    required this.foodname,
    required this.foodprice,
    required this.foodtype,
    required this.hotelname,
    required this.image,
    required this.orderid,
    required this.rating,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      totalprice: json['ORDER_PRICE'],
      quantity: json['ORDER_QUANTITY'],
      userid: json['USER_ID'],
      foodid: json['FOOD_ID'],
      orderid: json['ORDER_ID'],
      foodname: json['FOOD_NAME'],
      foodtype: json['FOOD_TYPE'],
      catogery: json['FOOD_CATOGERY'],
      rating: json['FOOD_RATING'],
      foodprice: json['FOOD_PRICE'],
      image: json['FOOD_IMAGE'],
      hotelname: json['HOTEL_NAME']
    );
  }
}