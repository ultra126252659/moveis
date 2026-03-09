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


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
          child:MyApp()));
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
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          );
      },
    );
  }
}


