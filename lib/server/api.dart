
import 'dart:convert';

import 'package:mind_space/model/dto/trace_add.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/MottoDetailVo.dart';
import 'package:mind_space/model/vo/breathe_list.dart';
import 'package:mind_space/model/vo/check_update.dart';
import 'package:mind_space/model/vo/context_list.dart';
import 'package:mind_space/model/vo/motto_List.dart';

import 'http.dart';

class Api {
  /// 添加埋点
  static void addTrace({required TraceAddDto data}) async {
    HttpUtil().post('/trace/addTrace', data: data);
  }

  /// 检查更新
  static Future<Result<CheckUpdateVo>> checkUpdate() async {
    var response = await HttpUtil().get('/context/checkUpdate');
    return Result.fromJson(response, (data) => CheckUpdateVo.fromJson(data));
  }

  /// 检查配置
  static Future<Result<bool>> checkInitContext(String version) async {
    var response = await HttpUtil().get('/context/checkInitContext', queryParameters: {
      'version': version,
    });
    return Result.fromJson(response, (data) => data);
  }

  /// 获取初始化数据
  static Future<Result<List<ContextListVo>>> getInitContextList() async {
    var response = await HttpUtil().get('/context/getInitContextList');
    return Result.fromJson(response, (data) => (data as List)
        .map((e) => ContextListVo.fromJson(e))
        .toList());
  }

  /// 获取白噪音列表
  static Future<Result<List<String>>> getNoiseList() async {
    var response = await HttpUtil().get('/noise/getNoiseList');
    return Result.fromJson(response, (data) => (data as List)
        .map((e) => jsonEncode(e))
        .toList());
  }

  /// 获取白噪音音频
  static Future<Result<String>> getNoiseAudio(int id) async {
    var response = await HttpUtil().get('/noise/getNoiseAudio', queryParameters: {
      'id': id,
    });
    return Result.fromJson(response, (data) => data);
  }

  /// 获取格言列表
  static Future<Result<List<MottoListVo>>> getMottoList(int pageIndex) async {
    var response = await HttpUtil().get('/motto/getMottoList', queryParameters: {
      'pageIndex': pageIndex,
    });
    return Result.fromJson(response, (data) => (data as List)
        .map((e) => MottoListVo.fromJson(e))
        .toList());
  }

  /// 获取格言详情
  static Future<Result<MottoDetailVo>> getMottoDetail(int id) async {
    var response = await HttpUtil().get('/motto/getMottoDetail', queryParameters: {
      'id': id,
    });
    return Result.fromJson(response, (data) => MottoDetailVo.fromJson(data));
  }

  /// 获取呼吸法列表
  static Future<Result<List<String>>> getBreatheList() async {
    var response = await HttpUtil().get('/breathe/getBreatheList');
    return Result.fromJson(response, (data) => (data as List)
        .map((e) => jsonEncode(e))
        .toList());
  }

  /// 获取呼吸法详情
  static Future<Result<String>> getBreatheDetail(int id) async {
    var response = await HttpUtil().get('/breathe/getBreatheDetail', queryParameters: {
      'id': id,
    });
    return Result.fromJson(response, (data) => data);
  }
}