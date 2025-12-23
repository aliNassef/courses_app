import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
 import '../di/service_locator.dart';
import '../helpers/cache_helper.dart';
import '../logging/app_logger.dart';
import '../logging/custom_bloc_observer.dart';
 import 'app_color.dart';

class AppInitializer {
  static Future<void> init() async {
   WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();
     Bloc.observer = CustomBlocObserver();
    await CacheHelper.init();
    await setupServiceLocator();
    
      await ScreenUtil.ensureScreenSize();

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary, // draw behind status bar
        statusBarIconBrightness: Brightness.light, // ANDROID
        statusBarBrightness: Brightness.light, // iOS (opposite of icons)
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    AppLogger.info('Courses APP Started ✅');
  }
}
