import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_complete_app/model/Weather_model.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';

class HourlyWeatherPage extends StatelessWidget {
  HourlyWeatherPage({required this.weatherData, required this.i});
  static String id = 'ForcastPage';

  WeatherModel? weatherData;
  int? i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000c1c),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getBackGroundColor(
                        weatherStateName: weatherData!.weatherStateName)[0],
                    weatherData!.getBackGroundColor(
                        weatherStateName: weatherData!.weatherStateName)[1],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${weatherData!.cityName.toString()}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins_Medium',
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${weatherData!.countryName.toString()}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Poppins_Medium',
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            '${weatherData!.avgTemp.toInt().toString()}',
                            style: TextStyle(
                              fontSize: 100,
                              fontFamily: 'Poppins_Medium',
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            right: -20,
                            bottom: 70,
                            child: Text(
                              '.',
                              style: TextStyle(
                                fontSize: 90,
                                fontFamily: 'Poppins_Medium',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..color = Colors.white
                                  ..strokeWidth = 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 20),
                        child: Image.asset(
                          // 'assets/images/snow.png',
                          //     'assets/images/cloudy_1.png',
                          //     'assets/images/sunny.png',
                          // 'assets/images/rain_2.png',
                          // 'assets/images/thunder.png',

                          weatherData!.getImage_Icon(
                              weatherStateName:
                                  weatherData!.weatherStateName)[0],
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35, left: 20),
                        child: Column(
                          children: [
                            Text(
                              '${weatherData!.weatherStateName.toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Poppins_Medium',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${weatherData!.minTemp.toInt().toString()}' +
                                  "/" +
                                  '${weatherData!.maxTemp.toInt().toString()}',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins_Medium',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weatherData!.date.toString().substring(0, 10)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins_Medium',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${DateFormat.EEEE().format(weatherData!.date).toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins_Medium',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  // Center(
                  //   child: Image.asset(
                  //     // 'assets/images/snow.png',
                  //     //     'assets/images/cloudy_1.png',
                  //     //     'assets/images/sunny.png',
                  //     // 'assets/images/rain_2.png',
                  //     // 'assets/images/thunder.png',
                  //     weatherData!.getImage(
                  //         weatherStateName: weatherData!.weatherStateName),
                  //     width: 100,
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                // separatorBuilder: (context, i) {
                //   return Divider();
                // },
                itemCount: weatherData!.weatherHours.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // gradient: LinearGradient(
                      //   colors: [
                      //     weatherData!.getBackGroundColor(
                      //         weatherStateName:
                      //             weatherData!.weatherHours[i].weatherState)[0],
                      //     weatherData!.getBackGroundColor(
                      //         weatherStateName:
                      //             weatherData!.weatherHours[i].weatherState)[1],
                      //   ],
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      // ),
                    ),
                    child: ListTile(
                      leading: Text(
                        // '${DateFormat.EEEE().format(weatherData.weatherHours[i].time).toString()}',
                        '${weatherData!.weatherHours[i].time.substring(11).toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins_Medium',
                          fontSize: 20,
                        ),
                      ),
                      title: Row(
                        children: [
                          Image.asset(
                            weatherData!.getHourImage(
                                weatherStateName:
                                    weatherData!.weatherHours[i].weatherState,
                                i: i),
                            width: 40,
                            height: 40,
                            // weatherData!.getIcon(
                            //     weatherStateName:
                            //         weatherData!.weatherHours[i].weatherState),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${weatherData!.weatherHours[i].weatherState.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Poppins_Medium',
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        ' ${weatherData!.weatherHours[i].avg_temp.toInt().toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins_Medium',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
