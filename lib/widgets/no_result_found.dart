import 'package:flutter/material.dart';
import 'package:weather_complete_app/pages/Search_Page.dart';
import 'package:weather_complete_app/widgets/Custom_Container_Primary.dart';

class NoResultFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/undraw_No_data_re_kwbl (2).png",
            ),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Result',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff2C2D35),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins_Medium',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sorry,there are no result for this search ,Please try another phrases',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff484B5B),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins_Medium',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomContainer(
                      title: 'Back to Search',
                      onTap: () {
                        Navigator.pushNamed(context, SearchPage.id);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
