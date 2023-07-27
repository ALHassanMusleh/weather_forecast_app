import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_cubit.dart';
import 'package:weather_complete_app/model/Weather_model.dart';
import 'package:weather_complete_app/pages/Home_Page.dart';
import 'package:weather_complete_app/service/get_weather_service.dart';
import 'package:weather_complete_app/widgets/Custom_Container_Primary.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static String id = 'SearchPage';
  @override
  Widget build(BuildContext context) {
    // var weather = BlocProvider.of<WeatherCubit>(context).weatherModel;
    String? CityName;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff47bcff),
              Color(0xffBCC8D6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/weather_background.png',
                  ),
                ),
                Text(
                  'Let\'s Serach City',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins_Medium',
                    color: Color(0xff0A0A22),
                  ),
                ),
                Text(
                  'Enter your information below',
                  style: TextStyle(
                    color: Color(0xff8B95A2),
                    fontSize: 15,
                    fontFamily: 'Poppins_Medium',
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  onChanged: (data) {
                    CityName = data;
                  },
                  onSubmitted: (data) async {
                    CityName = data;
                    //   WeatherService service = WeatherService();
                    //   List<WeatherModel>? weather =
                    //       await service.getWeather(city: CityName!);
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) {
                    //     return HomePage(
                    //       weatherData: weather,
                    //     );
                    //   }));
                    // },
                    BlocProvider.of<WeatherCubit>(context)
                        .getWeatherFromSearch(city: CityName!);
                    // if (weather!.isEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    // } else {
                    //   Navigator/.pop(context);
                    // }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'City Name',
                  ),
                ),
                SizedBox(height: 40),
                CustomContainer(
                    title: 'Search City Name',
                    onTap: () async {
                      // WeatherService service = WeatherService();
                      // List<WeatherModel>? weather =
                      //     await service.getWeather(city: CityName!);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return HomePage(
                      //     weatherData: weather,
                      //   );
                      // }));

                      BlocProvider.of<WeatherCubit>(context)
                          .getWeatherFromSearch(city: CityName!);
                      // if (weather!.isEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      // }else {
                      //   Navigator.pop(context);
                      // }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Center(
// child: Container(
// height: 180,
// margin: EdgeInsets.all(10),
// padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
// decoration: BoxDecoration(
// color: Colors.white.withOpacity(0.13),
// borderRadius: BorderRadius.circular(20),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Search City Name',
// style: TextStyle(
// color: Colors.white,
// fontSize: 22,
// fontFamily: 'Poppins_Medium',
// ),
// ),
// SizedBox(
// height: 10,
// ),
// TextField(
// onSubmitted: (data)  async {
// WeatherService service=  WeatherService();
// List<WeatherModel> weather =  await service.getWeather(city: data);
// Navigator.push(context, MaterialPageRoute(builder: (context) {
// return HomePage(
// weatherData: weather,
// );
// }));
// },
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.white,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
