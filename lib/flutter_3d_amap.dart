import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

export 'src/amap_3d_view.dart';
export 'src/interface/amap_3d_controller.dart';
export 'src/poi_search_model.dart';

class Flutter3dAMap {
  static const MethodChannel _channel = MethodChannel('plugins.weilu/flutter_3d_amap_');

  static String _webKey = '';
  static String get webKey => _webKey;

  static Future<bool?> setApiKey({String iOSKey = '', String webKey = ''}) async {
    if (kIsWeb) {
      _webKey = webKey;
    } else {
      if (Platform.isIOS) {
        return _channel.invokeMethod<bool>('setKey', iOSKey);
      }
    }
    return Future.value(true);
  }
}
