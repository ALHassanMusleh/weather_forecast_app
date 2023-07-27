import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_cubit.dart';
import 'package:weather_complete_app/pages/Hourly_Weather_Page.dart';
import 'package:weather_complete_app/pages/Home_Page.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';
import 'package:weather_complete_app/pages/Splash_Page.dart';
import 'package:weather_complete_app/pages/Start_Page.dart';
import 'package:weather_complete_app/service/get_weather_service.dart';
import 'package:weather_complete_app/widgets/no_result_found.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomePage.id: (context) => HomePage(),
          SearchPage.id: (context) => SearchPage(),
          StartPage.id: (context) => StartPage(),
        },
        home: SplashPage(),
      ),
    );
  }
}
