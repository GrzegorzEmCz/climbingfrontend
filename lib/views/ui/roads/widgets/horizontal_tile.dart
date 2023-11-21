import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/height_spacer.dart';
import 'package:climbingfrontend/views/common/width_spacer.dart';

class RoadHorizontalTile extends StatelessWidget {
  const RoadHorizontalTile({super.key, this.onTap, required this.road});

  final void Function()? onTap;
  final RoadsResponse road;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.9,
          height: hieght * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(road.imageUrl),
                  ),
                  const WidthSpacer(width: 15),
                  ReusableText(
                      text: road.name,
                      style: appstyle(24, Color(kDark.value), FontWeight.w600)),
                ],
              ),
              const HeightSpacer(size: 15),
              ReusableText(
                  text: road.rock,
                  style: appstyle(20, Color(kDark.value), FontWeight.w600)),
              ReusableText(
                  text: road.location,
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
              const HeightSpacer(size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                          text: road.grade,
                          style: appstyle(
                              23, Color(kDark.value), FontWeight.w600)),
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
        ),
      ),
    );
  }
}
