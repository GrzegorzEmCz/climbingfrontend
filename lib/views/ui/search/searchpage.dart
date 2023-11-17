import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:climbingfrontend/models/response/roads/roads_response.dart';
import 'package:climbingfrontend/services/helpers/roads_helper.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/loader.dart';
import 'package:climbingfrontend/views/ui/roads/widgets/road_tile.dart';
import 'package:climbingfrontend/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(color: Color(kLight.value)),
        title: CustomField(
          hintText: "Search for a road",
          controller: search,
          onEditingComplete: () {
            setState(() {
              
            });
          },
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(AntDesign.search1),
          ),
        ),
        elevation: 0,
      ),
      body: search.text.isNotEmpty
          ? Padding(
            padding:  EdgeInsets.symmetric(horizontal:12.0.w, vertical: 12.h),
            child: FutureBuilder<List<RoadsResponse>>(
                future: RoadsHelper.searchRoads(search.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else if (snapshot.data!.isEmpty) {
                    return const SearchLoading(text: "Road not found");
                  } else {
                    final roads = snapshot.data;
                    return ListView.builder(
                        itemCount: roads!.length,
                        itemBuilder: (context, index) {
                          final road = roads[index];
                          return VerticalTileWidget(road: road);
                        });
                  }
                }),
          )
          : const SearchLoading(
              text: "Start Searching For Roads",
            ),
    );
  }
}

