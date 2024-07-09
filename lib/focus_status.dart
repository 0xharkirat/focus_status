
import 'focus_status_platform_interface.dart';

class FocusStatus {
  Future<String?> getPlatformVersion() {
    return FocusStatusPlatform.instance.getPlatformVersion();
  }

  Future<int?> getFocusStatus() {
    return FocusStatusPlatform.instance.getFocusStatus();
  }

  Future<int?> getDNDAccess() {
    return FocusStatusPlatform.instance.getDNDAccess();
  }
}
