import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/server/api.dart';
import 'package:mind_space/service/cache.dart';
import 'state.dart';

class FocusDetailController extends GetxController {

  var state = FocusDetailState();

  @override
  void onReady() async {
    super.onReady();
    state.audioId = Get.arguments['id'];
    state.audioImgUrl.value = Get.arguments['imgUrl'];
    // 获取音频地址
    state.audioUrl = await getNoiseAudio(state.audioId);
    // 获取 star 状态
    List<String> noiseAudioStarList = CacheService.to.getList(CacheConstants.noiseStar);
    if (noiseAudioStarList.contains(state.audioId.toString())) {
      state.isStar.value = true;
    }
    // 获取播放模式
    String cacheMode = CacheService.to.getString(CacheConstants.noisePlayMode);
    if (cacheMode.isNotEmpty) {
      state.audioPlayMode.value = cacheMode;
    }
  }

  @override
  void onClose() {
    super.onClose();
    state.audioPlayer.stop();
    state.timer?.cancel();
  }

  /// 获取白噪音音频
  Future<String> getNoiseAudio(int id) async {
    Result<String> result = await Api.getNoiseAudio(id);
    if (ServerConfig.codeSuccess == result.code) {
      return result.data!;
    } else {
      Get.snackbar("获取音频失败！", result.msg!);
      return '';
    }
  }

  /// 切换播放状态
  void toggleAudio() {
    if (state.initAudio) {  // 如果为首次播放，则初始化播放器
      state.audioPlayer.setReleaseMode(ReleaseMode.loop);
      state.audioPlayer.play(UrlSource(state.audioUrl, mimeType: 'audio/mp3'));
      state.initAudio = false;
      initTimer();
    } else {  // 切换状态
      if (state.isPlaying.value) {
        state.audioPlayer.pause();
      } else {
        state.audioPlayer.resume();
      }
    }
    state.isPlaying.value = !state.isPlaying.value;
  }

  /// 切换收藏状态
  void toggleStar() {
    if (state.isStar.value) {
      CacheService.to.removeListByValue(CacheConstants.noiseStar, state.audioId.toString());
    } else {
      CacheService.to.addListByValue(CacheConstants.noiseStar, state.audioId.toString());
    }
    state.isStar.value = !state.isStar.value;
  }

  /// 设置选中的播放模式
  void setSelectedAudioPlayModeIndex(String code) {
    state.audioPlayMode.value = code;
    CacheService.to.setString(CacheConstants.noisePlayMode, code);
  }

  /// 初始化定时器
  void initTimer() {
    int timeStop = state.audioPlayModeList.firstWhere((element) => element['code'] == state.audioPlayMode.value)['value'];
    state.timer = Timer.periodic(Duration(minutes: timeStop), (timer) {
      state.audioPlayer.stop();
      state.isPlaying.value = false;
      state.initAudio = true;
      timer.cancel();
    });
  }
}