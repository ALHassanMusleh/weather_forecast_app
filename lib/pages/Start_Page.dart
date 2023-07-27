import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_cubit.dart';
// import 'package:location/location.dart' as loc;
// import 'package:permission_handler/permission_handler.dart';
import 'package:weather_complete_app/pages/Home_Page.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';
import 'package:weather_complete_app/widgets/Custom_Container_Primary.dart';
import 'package:geolocator/geolocator.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  static String id = 'StartPage';
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // void getLocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);
  //   print(position);
  //
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //     position.latitude,
  //     position.longitude,
  //
  //     localeIdentifier: 'en_US',
  //   );
  //   print(placemarks[0].locality);
  // }
  // String city = '';
  // loc.LocationData? locationData;
  // // List<Placemark>? placeMark;

  // void getPermission() async {
  //   if (await Permission.location.isGranted) {
  //     getLocation();
  //   } else {
  //     Permission.location.request();
  //   }
  // }

  // void getLocation() async {
  //   locationData = await loc.Location.instance.getLocation();
  // }

  // void getAddress() async {
  //   if (locationData != null) {
  //     //  List<Placemark> placeMark = await placemarkFromCoordinates(
  //     //         locationData!.latitude!, locationData!.longitude!);

  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         locationData!.latitude!, locationData!.longitude!);
  //     setState(() {
  //       city = placemarks[0].locality!;
  //     });
  //     print(placemarks[0].locality);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/weather_background.png',
            ),
            Text(
              'Weather',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins_Medium',
                color: Color(0xff0A0A22),
              ),
            ),
            Text(
              'Forecast',
              style: TextStyle(
                color: Color(0xff8B95A2),
                fontSize: 24,
                fontFamily: 'Poppins_Medium',
              ),
            ),
            SizedBox(height: 10),
            CustomContainer(
                title: 'Get Current Location',
                // onTap: getAddress,
                // ),
                onTap: () {
                  // Navigator.pushNamed(context, HomePage.id);
                  // getPermission();
                  // getAddress();
                  // getLocation();
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherFromLocation();
                  Navigator.pushNamed(context, HomePage.id);
                  // // getLocation();
                  // if (locationData != null) {
                  //   print(locationData!.latitude);
                  //   print(locationData!.longitude);
                  // } else {
                  //   print('not avaliable');
                  // }

                  // if (placeMark != null) {
                  //   print(placeMark![0].locality);
                  // } else {
                  //   print('Not available');
                  // }
                }),
            SizedBox(height: 10),
            // Text(city),
            CustomContainer(
                title: 'Search City Name',
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
