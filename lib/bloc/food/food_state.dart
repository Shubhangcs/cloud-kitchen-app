part of 'food_bloc.dart';

sealed class FoodState {}

final class FoodInitial extends FoodState {}

final class LoadingState extends FoodState {}

final class FoodFetchExceptionState extends FoodState {
  String exception;
  FoodFetchExceptionState({required this.exception});
}

final class FoodFetchSuccessState extends FoodState {
  List<dynamic> data;
  FoodFetchSuccessState({required this.data});
}

final class FoodFetchErrorState extends FoodState {
  String errorMessage;
  FoodFetchErrorState({required this.errorMessage});
}

final class FoodAddedSuccessState extends FoodState {
  String message;
  FoodAddedSuccessState({required this.message});
}

final class FoodAddedErrorState extends FoodState {
  String errorMessage;
  FoodAddedErrorState({required this.errorMessage});
}

final class FoodCartFetchSuccessState extends FoodState {
  final List<dynamic> data;
  FoodCartFetchSuccessState({required this.data});
}

final class FoodCartFetchErrorState extends FoodState {
  final String errorMessage;
  FoodCartFetchErrorState({required this.errorMessage});
}
