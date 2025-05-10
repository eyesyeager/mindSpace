import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class RandomUtils {

  static const _uuid = Uuid();

  static final _random = Random.secure();

  /// 获取 uuid
  static String getUUid() {
    return _uuid.v1().replaceAll("-", "") + getRandomStr(4);
  }

  /// 获取指定长度的随机字符串
  static String getRandomStr(int len) {
    final bytes = List.generate(len, (i) => _random.nextInt(256));
    return sha256.convert(bytes).toString().substring(0, len);
  }
}