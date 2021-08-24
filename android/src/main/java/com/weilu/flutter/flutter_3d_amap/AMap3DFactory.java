package com.weilu.flutter.flutter_3d_amap;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * @author weilu
 * 2019/6/26 0026 10:16.
 */
public class AMap3DFactory extends PlatformViewFactory {

    private final BinaryMessenger messenger;
    private AMap3Delegate delegate;
    private AMap3DView mAMap2DView;

    AMap3DFactory(BinaryMessenger messenger, AMap3Delegate delegate) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.delegate = delegate;
    }

    void setDelegate(AMap3Delegate delegate) {
        this.delegate = delegate;
        if (mAMap2DView != null) {
            mAMap2DView.setAMap3Delegate(delegate);
        }
    }

    @Override
    public PlatformView create(Context context, int id, Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        mAMap2DView = new AMap3DView(context, messenger, id, params, delegate);
        return mAMap2DView;
    }
}
