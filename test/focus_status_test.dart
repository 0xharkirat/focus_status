import 'package:flutter_test/flutter_test.dart';
import 'package:focus_status/focus_status.dart';
import 'package:focus_status/focus_status_platform_interface.dart';
import 'package:focus_status/focus_status_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFocusStatusPlatform
    with MockPlatformInterfaceMixin
    implements FocusStatusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<int?> getFocusStatus() {
    // TODO: implement getFocusStatus
    throw UnimplementedError();
  }
}

void main() {
  final FocusStatusPlatform initialPlatform = FocusStatusPlatform.instance;

  test('$MethodChannelFocusStatus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFocusStatus>());
  });

  test('getPlatformVersion', () async {
    FocusStatus focusStatusPlugin = FocusStatus();
    MockFocusStatusPlatform fakePlatform = MockFocusStatusPlatform();
    FocusStatusPlatform.instance = fakePlatform;

    expect(await focusStatusPlugin.getPlatformVersion(), '42');
  });
}
