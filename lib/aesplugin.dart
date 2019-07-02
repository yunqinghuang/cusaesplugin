import 'dart:async';

import 'package:flutter/services.dart';

class Aesplugin {
  static const MethodChannel _channel =
  const MethodChannel('aesplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  //编码
  static Future<String> aesEncode(String msg ,String password) async{
    var argument = {'msg':msg,'password':password};
    final String strEncode = await _channel.invokeMethod('aesEncode',argument);
    return strEncode;
  }
  //解码
  static Future<String> aesDecode(String msg ,String password) async{
    var argument = {'msg':msg,'password':password};
    final String strEncode = await _channel.invokeMethod('aesDecode',argument);
    return strEncode;
  }
}
