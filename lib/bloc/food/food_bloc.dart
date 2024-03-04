import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_kitchen/models/food_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<FoodFetchEvent>((event, emit) async {
      try {
        final response = await http.post(
          Uri.parse(foodByHotels),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(
            {event.constraint: event.data},
          ),
        );
        final jsonResponse = jsonDecode(response.body);
        final dartResponse =
            jsonResponse['data'].map((json) => Food.fromJson(json)).toList();
        emit(FoodFetchSuccessState(data: dartResponse));
      } catch (exception) {
        emit(FoodFetchExceptionState(exception: "Something Went Wrong"));
      }
    });
    on<FoodAddEvent>((event, emit) async {
      try {
        emit(LoadingState());
        for (int i = 0; i < event.data.length; i++) {
          if (event.data[i].isAddedFood) {
            final request = {
              "price": event.data[i].price * event.data[i].count,
              "quantity": event.data[i].count,
              "userid": event.userid,
              "foodid": event.data[i].id,
              "date": DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()
            };
            final response = await http.post(Uri.parse(addToCart),
                headers: {"Content-Type": "application/json"},
                body: jsonEncode(request));
            final jsonResponse = jsonDecode(response.body);
            print(jsonResponse);
          }
        }
        emit(FoodAddedSuccessState(message: "Added To Cart Successfully"));
      } catch (exception) {
        emit(FoodFetchExceptionState(exception: "Something Went Wrong"));
      }
    });
  }
}
