import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_kitchen/constants.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitalFetchEvent>((event, emit) async {
      final jsonResponse = await http.get(Uri.parse(hotels),
          headers: {"Content-Type": "application/json"});
      final response = jsonDecode(jsonResponse.body);
      emit(HomeInitialFetchState(data: response["data"]));
    });
    on<HomeHotelFoodFetchEvent>((event, emit) async {
      final jsonResponse = await http.post(Uri.parse(foodByHotels),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"hotel": event.hotelid}));
      final response = jsonDecode(jsonResponse.body);
      emit(HomeFoodFetchByHotelSuccess(data: response['data']));
    });
  }
}
