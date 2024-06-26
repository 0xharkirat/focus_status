import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'focus_status_method_channel.dart';

abstract class FocusStatusPlatform extends PlatformInterface {
  /// Constructs a FocusStatusPlatform.
  FocusStatusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FocusStatusPlatform _instance = MethodChannelFocusStatus();

  /// The default instance of [FocusStatusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFocusStatus].
  static FocusStatusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FocusStatusPlatform] when
  /// they register themselves.
  static set instance(FocusStatusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> getFocusStatus() {
    throw UnimplementedError('getFocusStatus() has not been implemented.');
  }
}
