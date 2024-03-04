part of 'food_bloc.dart';

sealed class FoodEvent {}

final class FoodFetchEvent extends FoodEvent {
  String constraint;
  dynamic data;
  FoodFetchEvent({required this.data, required this.constraint});
}

final class FoodAddEvent extends FoodEvent {
  List<dynamic> data;
  int userid;
  FoodAddEvent({required this.data , required this.userid});
}
