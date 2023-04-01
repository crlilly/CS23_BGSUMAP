import 'package:get_it/get_it.dart';
import 'permission/permission_service.dart';
import 'permission/PermissionHandlerPermissionService.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<PermissionService>
    (PermissionHandlerPermissionService());
}