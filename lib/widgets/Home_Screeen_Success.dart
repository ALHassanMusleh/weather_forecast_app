import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_complete_app/model/Weather_model.dart';
import 'package:weather_complete_app/pages/Hourly_Weather_Page.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';

class HomeScreenSuccess extends StatelessWidget {
  HomeScreenSuccess({required this.weatherData});
  final List<WeatherModel?>? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData![0]!.getBackGroundColor(
                weatherStateName: weatherData![0]!.weatherStateName)[0],
            weatherData![0]!.getBackGroundColor(
                weatherStateName: weatherData![0]!.weatherStateName)[1],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${weatherData![0]!.cityName.toString()}',
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
                        )),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.id);
                  },
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              '${weatherData![0]!.countryName.toString()}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Poppins_Medium',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      '${weatherData![0]!.avgTemp.toInt().toString()}',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 35, left: 20),
                  child: Row(
                    children: [
                      Text(
                        '${weatherData![0]!.weatherStateName.toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins_Medium',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${weatherData![0]!.minTemp.toInt().toString()}' +
                            "/" +
                            '${weatherData![0]!.maxTemp.toInt().toString()}',
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
            Center(
              child: Image.asset(
// 'assets/images/snow.png',
//     'assets/images/cloudy_1.png',
//     'assets/images/sunny.png',
// 'assets/images/rain_2.png',
// 'assets/images/thunder.png',
                weatherData![0]!.getImage_Icon(
                    weatherStateName: weatherData![0]!.weatherStateName)[0],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.13),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: weatherData!.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HourlyWeatherPage(
                            weatherData: weatherData![i],
                            i: i,
                          );
                        }));
                      },
                      child: ListTile(
                        leading: Image.asset(
                            weatherData![i]!.getImage_Icon(
                                weatherStateName:
                                    weatherData![i]!.weatherStateName)[1],
                            color: Colors.white),
                        title: Text(
                          '${DateFormat.EEEE().format(weatherData![i]!.date).toString()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins_Medium',
                            fontSize: 20,
                          ),
                        ),
                        trailing: Text(
                          ' ${weatherData![i]!.minTemp.toInt().toString()}' +
                              "/" +
                              '${weatherData![i]!.maxTemp.toInt().toString()}',
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
            ),
          ],
        ),
      ),
    );
  }
}
