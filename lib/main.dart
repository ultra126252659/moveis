import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/auto_route.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/auth/providers/auth_provider.dart';
import 'package:moves_final_project/features/details/presentation/screen/movie_details_screen.dart';
import 'package:moves_final_project/features/home/presentation/screen/home_screen.dart';
import 'package:moves_final_project/firebase_options.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/provider/UserProvider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child:  MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
    MyApp({super.key});
   final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child){
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          );
      },
    );
  }
}


