import 'package:flutter/material.dart';
import '../app_alert_dialog.dart';
import 'permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPermissionService implements PermissionService {
  @override
  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  @override
  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  @override
  Future<PermissionStatus> requestLocationPermission() async {
    return await Permission.location.request();
  }

  @override
  Future<bool> handleCameraPermission(BuildContext context) async {
    PermissionStatus cameraPermissionStatus = await requestCameraPermission();

    if (cameraPermissionStatus != PermissionStatus.granted) {
      print('Permission denied.');
      await showDialog(
        context: context,
         builder: (_context) => AppAlertDialog(
          onConfirm: () => openAppSettings(),
          title: 'Camera Permission',
          subtitle: 'Camera permissions should be granted to use this feature. Would you like to go to app settings to give permissions?',
         ),
         );
         return false;
    }
    return true;
  }

  Future<bool> handlePhotosPermission(BuildContext context) async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      print('Permission denied.');
      await showDialog(
        context: context,
         builder: (_context) => AppAlertDialog(
          onConfirm: () => openAppSettings(),
          title: 'Photos Permission',
          subtitle: 'Photos permissions should be granted to use this feature. Would you like to go to app settings to give permissions?',
         ),
         );
         return false;
    }
    return true;
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
    PermissionStatus locationPermissionStatus = await requestLocationPermission();

    if (locationPermissionStatus != PermissionStatus.granted) {
      print('Permission denied.');
      await showDialog(
        context: context,
         builder: (_context) => AppAlertDialog(
          onConfirm: () => openAppSettings(),
          title: 'Location Permission',
          subtitle: 'Location permissions should be granted to use this feature. Would you like to go to app settings to give permissions?',
         ),
         );
         return false;
    }
    return true;
  }
}
