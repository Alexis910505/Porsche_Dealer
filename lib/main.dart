// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zweck/app/core/styles/app_styles.dart';
import 'package:zweck/app/core/translations/app_translations.dart';
import 'package:zweck/app/presentation/mvvm/bindings/initial_binding.dart';
import 'package:zweck/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar inglés como idioma predeterminado
  await Get.updateLocale(const Locale('en', 'US'));

  // Inicializar el binding explícitamente y esperar a que termine
  final initialBinding = InitialBinding();
  await initialBinding.dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zweck',
      debugShowCheckedModeBanner: false,
      theme: AppStyles.lightTheme,
      darkTheme: AppStyles.darkTheme,
      themeMode: ThemeMode.system,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
    );
  }
}
