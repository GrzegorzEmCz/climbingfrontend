import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:climbingfrontend/controllers/exports.dart';
import 'package:climbingfrontend/models/request/bookmarks/bookmarks_model.dart';
import 'package:climbingfrontend/models/request/chat/create_chat.dart';
import 'package:climbingfrontend/models/request/messaging/send_message.dart';
import 'package:climbingfrontend/services/helpers/chat_helper.dart';
import 'package:climbingfrontend/services/helpers/messaging_helper.dart';
import 'package:climbingfrontend/views/common/app_bar.dart';
import 'package:climbingfrontend/views/common/custom_outline_btn.dart';
import 'package:climbingfrontend/views/common/exports.dart';
import 'package:climbingfrontend/views/common/height_spacer.dart';
import 'package:climbingfrontend/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class RoadPage extends StatefulWidget {
  const RoadPage({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  State<RoadPage> createState() => _RoadPageState();
}

class _RoadPageState extends State<RoadPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoadsNotifier>(
      builder: (context, roadsNotifier, child) {
        roadsNotifier.getRoad(widget.id);
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppBar(
                  text: widget.title,
                  actions: [
                    Consumer<BookMarkNotifier>(
                      builder: (context, bookMarkNotifier, child) {
                        bookMarkNotifier.loadRoads();
                        return GestureDetector(
                          onTap: () {
                            if (bookMarkNotifier.roads.contains(widget.id)) {
                              bookMarkNotifier.deleteBookMark(widget.id);
                            } else {
                              BookmarkReqResModel model =
                                  BookmarkReqResModel(road: widget.id);
                              bookMarkNotifier.addBookMark(model, widget.id);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: !bookMarkNotifier.roads.contains(widget.id)
                                ? const Icon(Fontisto.bookmark)
                                : const Icon(Fontisto.bookmark_alt),
                          ),
                        );
                      },
                    )
                  ],
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(CupertinoIcons.arrow_left),
                  )),
            ),
            body: FutureBuilder(
                future: roadsNotifier.road,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final road = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Stack(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              const HeightSpacer(size: 30),
                              Container(
                                width: width,
                                height: hieght * 0.27,
                                color: Color(kLightGrey.value),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage(road!.imageUrl),
                                    ),
                                    const HeightSpacer(size: 10),
                                    ReusableText(
                                        text: road.rock,
                                        style: appstyle(22, Color(kDark.value),
                                            FontWeight.w600)),
                                    const HeightSpacer(size: 5),
                                    ReusableText(
                                        text: road.location,
                                        style: appstyle(
                                            16,
                                            Color(kDarkGrey.value),
                                            FontWeight.normal)),
                                    const HeightSpacer(size: 15),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomOutlineBtn(
                                              width: width * 0.26,
                                              hieght: hieght * 0.04,
                                              color2: Color(kLight.value),
                                              text: road.type,
                                              color: Color(kOrange.value)),
                                          Row(
                                            children: [
                                              ReusableText(
                                                  text: road.grade,
                                                  style: appstyle(
                                                      22,
                                                      Color(kDark.value),
                                                      FontWeight.w600)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const HeightSpacer(size: 20),
                              ReusableText(
                                  text: road.description,
                                  style: appstyle(
                                      22, Color(kDark.value), FontWeight.w600)),
                              const HeightSpacer(size: 10),
                              Text(
                                desc,
                                textAlign: TextAlign.justify,
                                maxLines: 8,
                                style: appstyle(16, Color(kDarkGrey.value),
                                    FontWeight.normal),
                              ),
                              const HeightSpacer(size: 20),
                              ReusableText(
                                  text: "Requirements",
                                  style: appstyle(
                                      22, Color(kDark.value), FontWeight.w600)),
                              const HeightSpacer(size: 10),
                              SizedBox(
                                height: hieght * 0.6,
                                child: ListView.builder(
                                    itemCount: road.requirements.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final req = road.requirements[index];
                                      String bullet = "\u2022";
                                      return Text(
                                        "$bullet $req\n",
                                        maxLines: 4,
                                        textAlign: TextAlign.justify,
                                        style: appstyle(
                                            16,
                                            Color(kDarkGrey.value),
                                            FontWeight.normal),
                                      );
                                    }),
                              ),
                              const HeightSpacer(size: 20),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: CustomOutlineBtn(
                                  onTap: () {
                                    CreateChat model =
                                        CreateChat(userId: road.agentId);
                                    ChatHelper.apply(model).then((response) {
                                      if (response[0]) {
                                        SendMessage model = SendMessage(
                                            content:
                                                "Hello, You was added to the chat for road ${road.name}",
                                            chatId: response[1],
                                            receiver: road.agentId);
                                        MesssagingHelper.sendMessage(model)
                                            .whenComplete(() {
                                          Get.to(() => const MainScreen());
                                        });
                                      }
                                    });
                                  },
                                  color2: Color(kOrange.value),
                                  width: width,
                                  hieght: hieght * 0.06,
                                  text: "Join",
                                  color: Color(kLight.value)),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }));
      },
    );
  }
}
