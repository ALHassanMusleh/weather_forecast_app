import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  String countryName;
  DateTime date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  List<WeatherHoursModel> weatherHours;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.weatherHours,
  });

  factory WeatherModel.fromJson(dynamic data, i) {
    var jsonData = data['forecast']['forecastday'][i];
    return WeatherModel(
      cityName: data['location']['name'],
      countryName: data['location']['country'],
      date: DateTime.parse(jsonData['date']),
      avgTemp: jsonData['day']['avgtemp_c'],
      maxTemp: jsonData['day']['maxtemp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      weatherStateName: jsonData['day']['condition']['text'],
      weatherHours: List<WeatherHoursModel>.from(
          jsonData["hour"].map((x) => WeatherHoursModel.fromJson(x))),
    );
  }
  // List<WeatherForecastModel> weatherForecast;
  //
  // WeatherModel({required this.weatherForecast, required this.weatherHours});
  //
  // factory WeatherModel.fromJson(dynamic data) {
  //   var jsonData = data['forecast']['forecastday'];
  //   return WeatherModel(
  //     weatherForecast: List<WeatherForecastModel>.from(
  //         jsonData.map((x) => WeatherForecastModel.fromJson(x))),
  //   );
  // }

  String getImage({required String weatherStateName,i }) {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny') ||
        weatherStateName.contains('Clear')) {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/clear_day.png';
      } else {
        return 'assets/images/bg_state/nigth/clear_nigth.png';


      }
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/snow_day.png';
      } else {
        return 'assets/images/bg_state/nigth/snow_nigth.png';
      }
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName.contains('cloudy')) {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/cloudy_day.png';
      } else {
        return 'assets/images/bg_state/nigth/cloudy-night.png';
      }
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/rain_day.png';
      } else {
        return 'assets/images/bg_state/nigth/rain_nigth.png';
      }
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/thunderstorm_day.png';
      } else {
        return 'assets/images/bg_state/nigth/thunderstorm_nigth.png';
      }
    } else {
      if (weatherHours[i].weatherIcon.contains('day')) {
        return 'assets/images/bg_state/day/clear_day.png';
      } else {
        return 'assets/images/bg_state/nigth/clear_nigth.png';
      }
    }
  }

  List<Color> getBackGroundColor({required String weatherStateName}) {
    List<Color> color = [];
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny')) {
      color = [Color(0xff47c8ff), Color(0xff46b0fe)];
      return color;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      color = [Color(0xff7bd0fd), Color(0xff2eb2fa)];
      return color;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName.contains('cloudy')) {
      color = [Color(0xff43acfd), Color(0xff3798f0)];
      return color;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      color = [Color(0xff3d84ec), Color(0xff3b74cb)];
      return color;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      color = [Color(0xff7e4cc5), Color(0xff603899)];
      return color;
    } else {
      color = [Color(0xff47c8ff), Color(0xff46b0fe)];

      return color;
    }
  }

  String getIcon({required String weatherStateName}) {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny')) {
      return 'assets/images/icon_state/sun.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      return 'assets/images/icon_state/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName.contains('cloudy') ||
        weatherStateName.contains('cloudy')) {
      return 'assets/images/icon_state/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      return 'assets/images/icon_state/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      return 'assets/images/icon_state/lightning.png';
    } else {
      return 'assets/images/icon_state/sun.png';
    }
  }
}

// class WeatherForecastModel {
//   String cityName;
//   String countryName;
//   DateTime date;
//   double avgTemp;
//   double maxTemp;
//   double minTemp;
//   String weatherStateName;
//
//   WeatherForecastModel({
//     required this.cityName,
//     required this.countryName,
//     required this.date,
//     required this.avgTemp,
//     required this.maxTemp,
//     required this.minTemp,
//     required this.weatherStateName,
//   });
//
//   factory WeatherForecastModel.fromJson(dynamic data) {
//     var jsonData = data['forecast']['forecastday'];
//     return WeatherForecastModel(
//       cityName: data['location']['name'],
//       countryName: data['location']['country'],
//       date: DateTime.parse(jsonData['date']),
//       avgTemp: jsonData['day']['avgtemp_c'],
//       maxTemp: jsonData['day']['maxtemp_c'],
//       minTemp: jsonData['day']['mintemp_c'],
//       weatherStateName: jsonData['day']['condition']['text'],
//     );
//   }
// }

class WeatherHoursModel {
  String time;
  double avg_temp;
  String weatherIcon;
  String weatherState;

  WeatherHoursModel({
    required this.time,
    required this.avg_temp,
    required this.weatherIcon,
    required this.weatherState,
  });

  factory WeatherHoursModel.fromJson(dynamic data) {
    return WeatherHoursModel(
        time: data['time'],
        avg_temp: data['temp_c'],
        weatherIcon: data['condition']['icon'],
        weatherState: data['condition']['text']);
  }
}
