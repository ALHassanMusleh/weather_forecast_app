import 'package:flutter/material.dart';
import 'package:weather_complete_app/pages/Start_Page.dart';
import 'package:weather_complete_app/widgets/Custom_Container_Primary.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
            SizedBox(height: 20),
            // Text(city),
            CustomContainer(
                title: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, StartPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
