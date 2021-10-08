import 'dart:async';

import 'package:flutter/services.dart';

class LivechatFlex {
  static const MethodChannel _channel =
      const MethodChannel('zfx-com/livechat_flex');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> startChat(String licenseNo, String groupId,
      {String? visitorName, String? visitorEmail}) async {
    await _channel.invokeMethod('start_chat', <String, dynamic>{
      'license_no': licenseNo,
      'group_id': groupId,
      'visitor_name': visitorName,
      'visitor_email': visitorEmail,
    });
  }
}
