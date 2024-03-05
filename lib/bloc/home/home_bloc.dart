import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_kitchen/models/food_model.dart';
import 'package:cloud_kitchen/models/hotel_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_kitchen/constants.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitalFetchEvent>((event, emit) async {
      try {
        final jsonResponse = await http.get(Uri.parse(hotels),
            headers: {"Content-Type": "application/json"});
        final response = jsonDecode(jsonResponse.body);
        print(response);
        final List dartResponse =
            response["data"].map((json) => Hotel.fromJson(json)).toList();
        print(dartResponse);
        emit(HomeInitialFetchState(data: dartResponse));
      } catch (e) {
        emit(HomeExceptionState(exception: "Something Went Wrong"));
      }
    });
  }
}
