part of 'home_bloc.dart';

sealed class HomeEvent {}

final class HomeInitalFetchEvent extends HomeEvent {}


final class SearchFoodByHotelEvent extends HomeEvent {
  int hotelid;
  SearchFoodByHotelEvent({required this.hotelid});
}

final class SearchFoodByCatogeryEvent extends HomeEvent {
  String catogery;
  SearchFoodByCatogeryEvent({required this.catogery});
}
