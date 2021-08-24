
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_amap/src/interface/amap_3d_controller.dart';

import 'amap_3d_view_state.dart'
if (dart.library.html) 'web/amap_3d_view_state.dart'
if (dart.library.io) 'mobile/amap_3d_view_state.dart';

import 'poi_search_model.dart';


typedef AMap3DViewCreatedCallback = void Function(AMap3DController controller);

class AMap3DView extends StatefulWidget {
  
  const AMap3DView({
    Key? key,
    this.isPoiSearch = true,
    this.onPoiSearched,
    this.onAMap2DViewCreated,
  }) : super(key: key);
  
  final bool isPoiSearch;
  final AMap3DViewCreatedCallback? onAMap2DViewCreated;
  final Function(List<PoiSearch>)? onPoiSearched;

  @override
  AMap3DViewState createState() => AMap3DViewState();
}

