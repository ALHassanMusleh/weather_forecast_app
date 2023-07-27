import 'package:weather_complete_app/model/Weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  List<WeatherModel> weatherModel;

  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
