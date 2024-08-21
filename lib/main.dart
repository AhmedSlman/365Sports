import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/firebase_options.dart';
import 'package:sportat/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sportat/view/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'), 
      assetLoader: const CodegenLoader(),
      child: const Sport(),
    ),
  );
}

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: const SplashView(),
    );
  }
}
