import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, this.onTap, required this.road});

  final RoadsResponse? road;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          height: hieght * 0.15,
          width: width,
          color: Color(kLightGrey.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(kLightGrey.value),
                        radius: 25,
                        backgroundImage:
                             NetworkImage(road!.imageUrl),
                      ),
                      const WidthSpacer(width: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: road!.company,
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: road!.title,
                              style: appstyle(
                                  18, Color(kDarkGrey.value), FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(kLight.value),
                        child: const Icon(Ionicons.chevron_forward),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Row(
                  children: [
                    ReusableText(
                        text: road!.salary,
                        style:
                            appstyle(23, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                        text: "/${road!.period}",
                        style: appstyle(
                            23, Color(kDarkGrey.value), FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
