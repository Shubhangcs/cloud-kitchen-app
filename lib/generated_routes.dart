import 'package:cloud_kitchen/bloc/bloc/authenticaton_bloc.dart';
import 'package:cloud_kitchen/views/home_page.dart';
import 'package:cloud_kitchen/views/landing.dart';
import 'package:cloud_kitchen/views/login_page.dart';
import 'package:cloud_kitchen/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/register":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthenticatonBloc(),
            child: const RegisterPage(),
          ),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthenticatonBloc(),
            child: const LoginPage(),
          ),
        );
      case "/landing":
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) =>const HomePage(),
        );
    }
  }
}
