import 'dart:async';

import 'package:flutter/services.dart';

class LivechatFlex {
  static const MethodChannel _channel =
      const MethodChannel('zfx-com/livechat_flex');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> start_chat(String license_no, String group_id,
      {String visitor_name, String visitor_email}) async {
    await _channel.invokeMethod('start_chat', <String, dynamic>{
      'license_no': license_no,
      'group_id': group_id,
      'visitor_name': visitor_name,
      'visitor_email': visitor_email,
    });
  }
}
