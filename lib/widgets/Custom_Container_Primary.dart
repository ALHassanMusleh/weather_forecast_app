import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({required this.title, required this.onTap});

  String title;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 250,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff484B5B),
              Color(0xff2C2D35),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins_Medium',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
