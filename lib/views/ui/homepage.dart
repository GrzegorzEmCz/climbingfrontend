import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:climbingfrontend/controllers/exports.dart';
import 'package:climbingfrontend/views/common/app_bar.dart';
import 'package:climbingfrontend/views/common/drawer/drawer_widget.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/heading_widget.dart';
import 'package:climbingfrontend/views/common/height_spacer.dart';
import 'package:climbingfrontend/views/common/search.dart';
import 'package:climbingfrontend/views/common/vertical_shimmer.dart';
import 'package:climbingfrontend/views/common/vertical_tile.dart';
import 'package:climbingfrontend/views/ui/roads/road_page.dart';
import 'package:climbingfrontend/views/ui/roads/roads_list.dart';
import 'package:climbingfrontend/views/ui/roads/widgets/horizontal_shimmer.dart';
import 'package:climbingfrontend/views/ui/roads/widgets/horizontal_tile.dart';
import 'package:climbingfrontend/views/ui/search/searchpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
              )
            ],
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Consumer<RoadsNotifier>(
          builder: (context, roadNotifier, child) {
            roadNotifier.getRoads();
            roadNotifier.getRecent();
            return SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpacer(size: 10),
                    Text(
                      "Search \nFind & Climb",
                      style: appstyle(40, Color(kDark.value), FontWeight.bold),
                    ),
                    const HeightSpacer(size: 40),
                    SearchWidget(
                      onTap: () {
                        Get.to(() => const SearchPage());
                      },
                    ),
                    const HeightSpacer(size: 30),
                    HeadingWidget(
                      text: "Popular Roads",
                      onTap: () {
                        Get.to(() => const RoadListPage());
                      },
                    ),
                    const HeightSpacer(size: 15),
                    SizedBox(
                        height: hieght * 0.28,
                        child: FutureBuilder(
                            future: roadNotifier.roadList,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const HorizontalShimmer();
                              } else if (snapshot.hasError) {
                                return Text("Error ${snapshot.error}");
                              } else {
                                final roads = snapshot.data;
                                return ListView.builder(
                                    itemCount: roads!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final road = roads[index];
                                      return RoadHorizontalTile(
                                        onTap: () {
                                          Get.to(() => RoadPage(
                                              title: road.name, id: road.id));
                                        },
                                        road: road,
                                      );
                                    });
                              }
                            })),
                    const HeightSpacer(size: 20),
                    HeadingWidget(
                      text: "Recently Posted",
                      onTap: () {},
                    ),
                    const HeightSpacer(size: 20),
                    FutureBuilder(
                        future: roadNotifier.recent,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const VerticalShimmer();
                          } else if (snapshot.hasError) {
                            return Text("Error ${snapshot.error}");
                          } else {
                            final roads = snapshot.data;
                            return VerticalTile(
                              onTap: () {
                                Get.to(() =>
                                    RoadPage(title: roads!.name, id: roads.id));
                              },
                              road: roads,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
