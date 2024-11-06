import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission(Permission permission) async {
  try {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  if (build.version.sdkInt >= 30) {
    var re = await Permission.storage.request();
    if (re.isGranted) {
      return true;
    } else {
      return false;
    }
  } else {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
  } catch (e) {
    print(e);
    return false;
  }
  
}
Future<void> requestCameraAndStoragePermissions() async {
  var cameraStatus = await Permission.camera.status;
  if (!cameraStatus.isGranted) {
    cameraStatus = await Permission.camera.request();
  }
}
