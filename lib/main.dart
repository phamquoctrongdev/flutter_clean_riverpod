import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/ui/core/loading_mask.dart';
import 'package:flutter_clean_riverpod/service/app_initializer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generated/codegen_loader.g.dart';
import 'presentation/common/app_constants.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/dark_theme.dart';
import 'presentation/theme/light_theme.dart';
import 'presentation/theme/theme_controller.dart';

void main() async {
  await AppInitializer.getInstance.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          AppConstants.enUS,
          AppConstants.viVN,
          AppConstants.jaJP
        ],
        path: AppConstants.assetTranslationPath,
        fallbackLocale: AppConstants.enUS,
        assetLoader: const CodegenLoader(),
        startLocale: AppConstants.enUS,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      theme: ThemeData.light().copyWith(
        splashFactory: NoSplash.splashFactory,
        extensions: <ThemeExtension<dynamic>>[
          LightTheme(),
        ],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        splashFactory: NoSplash.splashFactory,
        extensions: <ThemeExtension<dynamic>>[
          DarkTheme(),
        ],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode.value ?? ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: AppRouter.instance.router,
      builder: (context, child) {
        if (child == null) {
          return const SizedBox();
        } else {
          return LoadingMask(child: child);
        }
      },
    );
  }
}
