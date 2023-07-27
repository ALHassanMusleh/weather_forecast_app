import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_cubit.dart';
import 'package:weather_complete_app/Cubit/WeatherHome_Cubit/Weather_state.dart';
import 'package:weather_complete_app/model/Weather_model.dart';
import 'package:weather_complete_app/pages/Hourly_Weather_Page.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';
import 'package:weather_complete_app/widgets/Home_Screeen_Success.dart';
import 'package:weather_complete_app/widgets/no_result_found.dart';

class HomePage extends StatelessWidget {
  HomePage();

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<WeatherCubit, WeatherState>(
      //   builder: (context, state) {
      //     if (state is WeatherLoadingState) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (state is WeatherSuccessState) {
      //       print('success');
      //       if(state.weatherModel.isNotEmpty){
      //         return HomeScreenSuccess(weatherData: state.weatherModel);
      //       }else {
      //         return Center(child: Text('No weather data available.'));
      //       }
      //     } else if (state is WeatherFailureState) {
      //       print('fail');
      //       return NoResultFoundScreen();
      //     } else {
      //       return Center(child: Text('initial State'),);
      //     }
      //   },
      // ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            print('Loading');
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            print('Success');
            return HomeScreenSuccess(weatherData: state.weatherModel);
          } else if (state is WeatherFailureState) {
            print('fail');
            return NoResultFoundScreen();
          } else {
            return Center(
              child: Text('initial State'),
            );
          }
        },
      ),
    );
  }
}

// Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// 'assets/images/rainy5.jpg',
// ),
// fit: BoxFit.fitHeight,
// ),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 45, left: 40, right: 30),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// padding:
// EdgeInsets.symmetric(horizontal: 10, vertical: 7),
// decoration: BoxDecoration(
// color: Color(0xff01b9ff),
// borderRadius: BorderRadius.circular(20),
// ),
// child: Text(
// 'Your Location',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// CircleAvatar(
// backgroundColor: Colors.white,
// radius: 17,
// child: IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.search,
// size: 22,
// color: Color(0xffc0c0c0),
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 20,
// ),
// Text(
// 'London',
// style: TextStyle(
// fontSize: 40,
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontFamily: 'Poppins_Medium',
// ),
// ),
// Text(
// 'United Kingdom',
// style: TextStyle(
// fontSize: 25,
// color: Colors.white,
// fontFamily: 'Poppins_Medium',
// ),
// ),
// ],
// ),
// ),
// Container(
// height: 330,
// width: double.infinity,
// decoration: BoxDecoration(
// // color: Colors.white.withOpacity(0.13),
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30),
// topRight: Radius.circular(30),
// ),
// ),
// child: Padding(
// padding:
// const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Updated 12m ago',
// style: TextStyle(
// color: Color(0xffd4d4d4),
// fontFamily: 'Poppins_Medium',
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Heavy Rain',
// style: TextStyle(
// fontSize: 20,
// fontFamily: 'Poppins_Medium',
// fontWeight: FontWeight.bold,
// ),
// ),
// Column(
// children: [
// Text(
// 'THU',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Color(0xffd4d4d4),
// fontFamily: 'Poppins_Medium',
// ),
// ),
// Text(
// '06',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontFamily: 'Poppins_Medium',
// ),
// ),
// ],
// ),
// ],
// ),
// Stack(
// clipBehavior: Clip.none,
// children: [
// Text(
// '40',
// style: TextStyle(
// fontSize: 100,
// fontFamily: 'Poppins_Medium',
// foreground: Paint()
// ..style = PaintingStyle.stroke
// ..color = Colors.black
// ..strokeWidth = 2,
// ),
// ),
// Positioned(
// right: -20,
// bottom: 50,
// child: Text(
// '.',
// style: TextStyle(
// fontSize: 120,
// fontFamily: 'Poppins_Medium',
// foreground: Paint()
// ..style = PaintingStyle.stroke
// ..color = Colors.black
// ..strokeWidth = 2,
// ),
// ),
// ),
// Positioned(
// bottom: 30,
// left: -5,
// child: Image.asset(
// 'assets/images/clear.png',
// height: 35,
// )),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Next 3 Days',
// style: TextStyle(
// fontSize: 20,
// fontFamily: 'Poppins_Medium',
// fontWeight: FontWeight.bold,
// ),
// ),
// TextButton(
// onPressed: () {
// Navigator.pushNamed(context, ForecastPage.id);
// },
// child: Text('View all')),
// ],
// ),
// // Expanded(
// //   child: ListView.builder(
// //       itemCount: 3,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           leading: Image.asset(
// //             'assets/images/clear.png',
// //             height: 35,
// //           ),
// //           title: Text('Heavy rain'),
// //         );
// //       }),
// // ),
// ],
// ),
// ),
// ),
// ],
// ),
// )

//
// ListView.builder(
// itemCount: weatherData!.length,
// itemBuilder: (context, i) {
// return ListTile(
// leading: Image.asset(weatherData![i].getIcon(),
// color: Colors.white),
// title: Text(
// '${DateFormat.EEEE().format(weatherData![i].date).toString()}',
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Poppins_Medium',
// fontSize: 20,
// ),
// ),
// trailing: Text(
// ' ${weatherData![i].minTemp.toInt().toString()}' +
// "/" +
// '${weatherData![i].maxTemp.toInt().toString()}',
// style: TextStyle(
// fontSize: 20,
// fontFamily: 'Poppins_Medium',
// color: Colors.white,
// ),
// ),
// );
// },
// )

// ListView.builder(
// itemCount: weatherData!.weatherHours.length,
// itemBuilder: (context, i) {
// return ListTile(
// leading: Text(
// weatherData![0]
//     .weatherHours[i]
//     .weatherState
//     .toString(),
// style: TextStyle(fontSize: 12),
// ),
// title: Text(
// // '${DateFormat.EEEE().format(weatherData![i].date).toString()}',
// weatherData![0].weatherHours[i].avg_temp.toString(),
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Poppins_Medium',
// fontSize: 15,
// ),
// ),
// trailing: Text(
// weatherData![0].weatherHours[i].time.toString(),
// style: TextStyle(
// fontSize: 10,
// fontFamily: 'Poppins_Medium',
// color: Colors.white,
// ),
// ),
// );
// },
// )
