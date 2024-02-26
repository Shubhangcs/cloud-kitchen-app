part of 'home_bloc.dart';

sealed class HomeEvent {}

final class HomeInitalFetchEvent extends HomeEvent {}

final class HomeHotelFoodFetchEvent extends HomeEvent {
  int hotelid;
  HomeHotelFoodFetchEvent({required this.hotelid});
}

