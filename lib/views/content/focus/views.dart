import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_space/views/content/focus/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FocusView extends GetView<FocusController> {

  const FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(6),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: controller.noiseList.length,
      itemBuilder: (context, index) {
        var item = controller.noiseList[index];
        return buildNoiseCard(item.id, item.name, item.picUrl);
      },
    );
  }

  Widget buildNoiseCard(int id, String word, String imgUrl) {
    return GestureDetector(
      onTap: () => controller.jumpDetail(id, word, imgUrl),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            word,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}