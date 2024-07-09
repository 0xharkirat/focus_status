import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'focus_status_platform_interface.dart';

/// An implementation of [FocusStatusPlatform] that uses method channels.
class MethodChannelFocusStatus extends FocusStatusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('focus_status');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> getFocusStatus() async {
    final status = await methodChannel.invokeMethod<int>('getFocusStatus');
    return status;
  }

  @override
  Future<int?> getDNDAccess() async {
    final dndAccess = await methodChannel.invokeMethod<int>('getDNDAccess');
    return dndAccess;
  }
}
