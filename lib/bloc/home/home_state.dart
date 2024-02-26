part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeInitialFetchState extends HomeState {
  List data;
  HomeInitialFetchState({required this.data});
}

final class HomeFoodFetchByHotelSuccess extends HomeState {
  List data;
  HomeFoodFetchByHotelSuccess({required this.data});
}
