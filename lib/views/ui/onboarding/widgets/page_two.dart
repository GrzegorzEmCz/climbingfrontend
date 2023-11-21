import 'package:climbingfrontend/views/common/app_style.dart';
import 'package:climbingfrontend/views/common/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:climbingfrontend/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const HeightSpacer(size: 45),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset("assets/images/S2A.jpeg"),
            ),
            const HeightSpacer(size: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "everything about \n climbing \n in one place",
                  textAlign: TextAlign.center,
                  style: appstyle(30, Color(kLight.value), FontWeight.w500),
                ),
                const HeightSpacer(size: 10),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "see what you can do with climbing app",
                    style: appstyle(
                        14, Color(kLightGrey.value), FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
