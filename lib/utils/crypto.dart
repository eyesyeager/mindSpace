import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoUtils {
  /// MD5
  static String toMd5(String str) {
    final utf = utf8.encode(str);
    final digest = md5.convert(utf);
    return digest.toString();
  }

  /// SHA1
  static String toSHA1(String str) {
    final utf = utf8.encode(str);
    final digest = sha1.convert(utf);
    return digest.toString();
  }
}