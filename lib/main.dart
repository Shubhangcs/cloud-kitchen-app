import 'package:cloud_kitchen/views/home_page.dart';
import 'package:cloud_kitchen/views/landing.dart';
import 'package:cloud_kitchen/views/register_page.dart';
import 'package:cloud_kitchen/views/widgets/custom_hotel_card.dart';
import 'package:cloud_kitchen/views/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'generated_routes.dart';
import 'views/login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDirectory.path);
  final box = await Hive.openBox('authkey');
  runApp(MyApp(token: box.get('tokens')));
  box.close();
}

class MyApp extends StatelessWidget {
  final dynamic token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerate,
      initialRoute: (token == null)
          ? "/landing"
          : (JwtDecoder.isExpired(token) == false)
              ? "/home"
              : "/login",
      title: "Cloud Kitchen",
    );
  }
}
