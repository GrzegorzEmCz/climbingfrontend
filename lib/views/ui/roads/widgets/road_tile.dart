import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/width_spacer.dart';
import 'package:climbingfrontend/views/ui/roads/road_page.dart';

class VerticalTileWidget extends StatelessWidget {
  const VerticalTileWidget({super.key, required this.road});
  final RoadsResponse road;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          Get.to(() => RoadPage(title: road.company, id: road.id));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          height: hieght * 0.15,
          width: width,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(road.imageUrl),
                      ),
                      const WidthSpacer(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: road.company,
                              style: appstyle(
                                  20, Color(kDark.value), FontWeight.w600)),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                                text: road.title,
                                style: appstyle(20, Color(kDarkGrey.value),
                                    FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    child: Icon(
                      Ionicons.chevron_forward,
                      color: Color(kOrange.value),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 65.w),
                child: Row(
                  children: [
                    ReusableText(
                        text: road.salary,
                        style:
                            appstyle(22, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                        text: "/${road.period}",
                        style: appstyle(
                            20, Color(kDarkGrey.value), FontWeight.w600)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
