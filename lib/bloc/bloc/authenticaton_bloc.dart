import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:cloud_kitchen/constants.dart';
part 'authenticaton_event.dart';
part 'authenticaton_state.dart';

bool isValidMail(email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

class AuthenticatonBloc extends Bloc<AuthenticatonEvent, AuthenticatonState> {
  AuthenticatonBloc() : super(AuthenticatonInitial()) {
    on<RegisterEvent>((event, emit) async {
      try {
        if (!isValidMail(event.userEmailId)) {
          emit(InvalidEmailFormatState(errorMessage: "Invalid Mail Id"));
        } else if (event.userPassword.length < 8) {
          emit(InvalidPasswordFormatState(
              errorMessage: "Password Must Contain 8 Characters"));
        } else {
          emit(LoadingState());
          final request = {
            "name": event.userName,
            "email": event.userEmailId,
            "password": event.userPassword
          };
          final jsonResponse = await http.post(Uri.parse(register),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(request));
          final response = jsonDecode(jsonResponse.body);
          if (jsonResponse.statusCode < 400) {
            emit(RegisterSuccessState(message: response['message']));
          } else {
            emit(RegisterFailedState(errorMessage: response['message']));
          }
        }
      } catch (exception) {
        emit(ExceptionState(exception: "Something Went Wrong"));
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        if (!isValidMail(event.userEmailId)) {
          emit(InvalidEmailFormatState(errorMessage: "Enter A Valid Mail Id"));
        } else if (event.userPassword.length < 8) {
          emit(InvalidPasswordFormatState(
              errorMessage: "Password Must Contain 8 Character"));
        } else {
          emit(LoadingState());
          final request = {
            "email": event.userEmailId,
            "password": event.userPassword
          };
          final jsonResponse = await http.post(
            Uri.parse(register),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(
              request,
            ),
          );
          final response = jsonDecode(jsonResponse.body);
          if (jsonResponse.statusCode < 400) {
            final box = await Hive.openBox('Key');
            emit(LoginSuccessState(message: response['message']));
            box.put('token', response['token']);
            box.close();
          } else {
            emit(LoginFailedState(errorMessage: response['message']));
          }
        }
      } catch (exception) {
        emit(ExceptionState(exception: "Something Went Wrong"));
      }
    });
  }
}
