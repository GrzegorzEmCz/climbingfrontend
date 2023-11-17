import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:climbingfrontend/controllers/roads_provider.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/views/common/app_bar.dart';
import 'package:climbingfrontend/views/common/loader.dart';
import 'package:climbingfrontend/views/ui/roads/widgets/road_tile.dart';
import 'package:provider/provider.dart';

class RoadListPage extends StatelessWidget {
  const RoadListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var roadlist = Provider.of<RoadsNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
            text: "Roads",
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(CupertinoIcons.arrow_left),
            )),
      ),
      body: FutureBuilder<List<RoadsResponse>>(
          future: roadlist.roadList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            }else if (snapshot.data!.isEmpty) {
              return const SearchLoading(text: "No Roads to display");
            }  else {
              final road = snapshot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                    itemCount: road!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final roads = road[index];
                      return VerticalTileWidget(road: roads,);
                    }),
              );
            }
          }),
    );
  }
}
