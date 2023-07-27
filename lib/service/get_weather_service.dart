import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_complete_app/model/Weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '271556f0179c4956a7c235110230102';
  Future<List<WeatherModel>> getWeather({required String city}) async {
    // WeatherModel? weatherModel;
    // List<WeatherModel> weather = [];
    // try {
    http.Response response = await http
        .get(Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city&days=7'));

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    List<WeatherModel> weather = [];

    for (int i = 0; i <= 2; i++) {
      // weatherModel = WeatherModel.fromJson(data, i);
      // weather.add(weatherModel);
      weather.add(WeatherModel.fromJson(data, i));
    }
    print(weather[0].date);
    print(weather[0].avgTemp);
    // print(weather[0].weatherIcon);
    // print(weather[0].weatherHours[22].avg_temp);
    // print(weather[0].weatherHours[22].time);
    // } catch (e) {
    //   print('fail');
    //   print(weather);
    //   print(weatherModel);
    //   print(e.toString());
    // }
    return weather;
  }
// https://api.openweathermap.org/data/2.5/weather?lat=31.42&lon=34.38&appid=9b0c572c9c40db5896a792942828c17c

// Future<List<WeatherModel>?> getWeatherLonLat({required double lat,required double long}) async {
//     WeatherModel weatherModel;
//     List<WeatherModel> weather = [];
//     try {
//       http.Response response = await http
//           .get(Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$city&days=7'));

//       Map<String, dynamic> data = jsonDecode(response.body);

//       for (int i = 0; i <= 2; i++) {
//         weatherModel = WeatherModel.fromJson(data, i);
//         weather.add(weatherModel);
//       }
//       print(weather[0].date);
//       print(weather[0].avgTemp);
//       // print(weather[0].weatherHours[22].avg_temp);
//       // print(weather[0].weatherHours[22].time);
//     } catch (e) {
//       print('fail');
//       print(e.toString());
//     }
//     return weather;
//   }
}
