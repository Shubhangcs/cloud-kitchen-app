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

final class FoodAddedSuccessState extends FoodState {
  String message;
  FoodAddedSuccessState({required this.message});
}
