import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_state.dart';
import 'package:weather_complete_app/model/Weather_model.dart';
import 'package:weather_complete_app/service/get_location.dart';
import 'package:weather_complete_app/service/get_weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  WeatherService weatherService;

  List<WeatherModel>? weatherModel;

  void getWeatherFromSearch({required String city}) async {
    emit(WeatherLoadingState());
    try {
      print('success');
      weatherModel = await weatherService.getWeather(city: city);
      // weatherModel = weather;
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      print('error');
      emit(WeatherFailureState());
    }
  }

  void getWeatherFromLocation() async {
    emit(WeatherLoadingState());
    try {
      print('success');
      // location =
      // 'Lat: ${position.latitude} , Long: ${position.longitude}';
      List<Placemark> placemark = await GetLocation().getLocation();
      weatherModel =
          await weatherService.getWeather(city: placemark[0].locality!);
      // weatherModel = weather;
      print(placemark[0].locality!);

      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      print('error');
      emit(WeatherFailureState());
    }
  }
}
