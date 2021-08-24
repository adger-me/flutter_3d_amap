

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_3d_amap/flutter_3d_amap.dart';
import 'package:flutter_3d_amap/src/mobile/amap_3d_controller.dart';


class AMap3DViewState extends State<AMap3DView> {

  final Completer<AMap3DMobileController> _controller = Completer<AMap3DMobileController>();

  void _onPlatformViewCreated(int id) {
    final AMap3DMobileController controller = AMap3DMobileController(id, widget);
    _controller.complete(controller);
    if (widget.onAMap2DViewCreated != null) {
      widget.onAMap2DViewCreated!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins.weilu/flutter_2d_amap',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: _CreationParams.fromWidget(widget).toMap(),
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'plugins.weilu/flutter_2d_amap',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: _CreationParams.fromWidget(widget).toMap(),
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the flutter_2d_amap plugin');
  }
}

/// 需要更多的初始化配置，可以在此处添加
class _CreationParams {
  _CreationParams({this.isPoiSearch = true});

  static _CreationParams fromWidget(AMap3DView widget) {
    return _CreationParams(
      isPoiSearch: widget.isPoiSearch,
    );
  }

  final bool isPoiSearch;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isPoiSearch': isPoiSearch,
    };
  }
}