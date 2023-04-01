import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'media_service_interface.dart';
import '../permission/permission_service.dart';
import '../service_locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class MediaService implements MediaServiceInterface {
  @override
  PermissionService get permissionService => getIt<PermissionService>();

  Future<bool> _handleImageUploadPermissions(BuildContext context, AppImageSource? _imageSource) async {
    if (_imageSource == null) {
      return false;
    }
    if (_imageSource == AppImageSource.camera) {
      return await permissionService.handleCameraPermission(context);
    }
    else if (_imageSource == AppImageSource.gallery) {
      return await permissionService.handlePhotosPermission(context);
    }
    else {
      return false;
    }
  }

  @override
  Future<File?> uploadImage(
    BuildContext context,
    AppImageSource appImageSource, {
      bool shouldCompress = true,
    }) async {
      bool canProceed = await _handleImageUploadPermissions(context, appImageSource);

      if (canProceed) {
        File? processedPickedImageFile;

        ImageSource? _imageSource = ImageSource.values.byName(appImageSource.name);

        final imagePicker = ImagePicker();
        final rawPickedImageFile = await imagePicker.pickImage(source: _imageSource, imageQuality: 50);

        if (rawPickedImageFile != null) {
          processedPickedImageFile = File(rawPickedImageFile.path);
          if (shouldCompress) {
            processedPickedImageFile = await compressFile(processedPickedImageFile);
          }
        }
        return processedPickedImageFile;
      }
    }

    @override
    Future<File?> compressFile(File file, {int quality = 30}) async {
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = dir.absolute.path + '/${Random().nextInt(1000)}-temp.jpg';

      return await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
      );
    }
}