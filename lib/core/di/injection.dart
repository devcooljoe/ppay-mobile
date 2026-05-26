import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/services/hive_service.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await HiveService.init();
  getIt.init();
}