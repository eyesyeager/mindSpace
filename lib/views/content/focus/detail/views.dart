
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'controller.dart';

class FocusDetailView extends StatelessWidget {

  final controller = Get.put(FocusDetailController());

  final state = Get.find<FocusDetailController>().state;

  FocusDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(state.audioImgUrl.value),
                fit: BoxFit.cover,
              ),
            ),
            child: buildAudio(),
          )),
          buildFunc(context)
        ],
      ),
    );
  }

  /// 构建功能控件
  Widget buildFunc(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 30,
      right: 10,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.punch_clock_sharp, color: Colors.white),
            onPressed: () {
              showBottomSheet(context);
            },
          ),
          IconButton(
            icon: Obx(() => Icon(
                Icons.star,
                color: state.isStar.value ? Colors.yellow : Colors.white
            )),
            onPressed: controller.toggleStar,
          ),
        ],
      ),
    );
  }

  /// 构建音频播放控件
  Widget buildAudio() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              Get.arguments['word'],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Obx(() => Icon(
                  state.isPlaying.value ? Icons.pause : Icons.play_arrow,
                  color: Colors.blue
              )),
              onPressed: controller.toggleAudio,
            ),
          ),
        ],
      ),
    );
  }

  /// 显示底部选择弹窗
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var index = 0; index < state.audioPlayModeList.length; index++)
                Obx(() {
                  var item = state.audioPlayModeList[index];
                  return ListTile(
                    title: Center(child: Text(
                      item['name'],
                      style: TextStyle(color: state.audioPlayMode.value == item['code'] ? Colors.blue : Colors.black)
                    )),
                    onTap: () => controller.setSelectedAudioPlayModeIndex(item['code']),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}