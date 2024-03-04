part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeExceptionState extends HomeState {
  String exception;
  HomeExceptionState({required this.exception});
}

final class HomeInitialFetchState extends HomeState {
  List data;
  HomeInitialFetchState({required this.data});
}

final class SearchFoodByHotelEventSuccess extends HomeState {
  List data;
  SearchFoodByHotelEventSuccess({required this.data});
}
