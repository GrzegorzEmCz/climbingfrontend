import 'package:flutter/material.dart';
import 'package:climbingfrontend/views/common/exports.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableText(text: "OnBoardingScreen", style: appstyle(30, Color(kOrange.value), FontWeight.bold),),
      ),
    );
  }
}


