import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class FocusDetailState {
  /// 音频 ID
  var audioId = 0;

  /// 音频地址
  var audioUrl = '';

  /// 音频图片地址
  RxString audioImgUrl = ''.obs;

  /// 是否初始化音频
  var initAudio = true;

  /// 播放状态
  RxBool isPlaying = false.obs;

  /// 是否收藏
  RxBool isStar = false.obs;

  /// 播放器
  AudioPlayer audioPlayer = AudioPlayer();

  /// 播放模式
  RxString audioPlayMode = 'loop'.obs;

  /// 播放模式列表
  List<Map<String, dynamic>> audioPlayModeList = [
    {
      "code": "loop",
      "name": "循环播放",
      "value": 999999
    },
    {
      "code": "ten",
      "name": "定时 10 分钟",
      "value": 10
    },
    {
      "code": "thirty",
      "name": "定时 30 分钟",
      "value": 30
    },
    {
      "code": "sixty",
      "name": "定时 60 分钟",
      "value": 30
    },
    {
      "code": "ninety",
      "name": "定时 90 分钟",
      "value": 90
    },
    {
      "code": "greatHundred",
      "name": "定时 120 分钟",
      "value": 120
    },
  ];

  /// 定时器
  Timer? timer;
}