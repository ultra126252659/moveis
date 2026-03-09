import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/features/auth/presentation/register_screen.dart';
import 'package:moves_final_project/features/onbording/presentation/Screen/Onboarding.dart';
import 'package:moves_final_project/features/onbording/presentation/Screen/splash_Screen.dart';
import 'package:provider/provider.dart';

import 'di.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/reset_password_screen.dart';
import 'features/home/presentation/bloc/UserProvider.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_state.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeBloc>()),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return  MyApp();
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Splashscreen.routeName,

            routes: {
              Splashscreen.routeName: (c) => Splashscreen(),
              MoviesIntroScreen.routeName: (c) => MoviesIntroScreen(),
              LoginScreen.routeName: (c) => LoginScreen(),
              RegisterScreen.routeName: (c) => RegisterScreen(),
              ResetPasswordScreen.routeName: (c) => ResetPasswordScreen(),
              HomeScreen.routeName: (c) => HomeScreen(),
            },

          );
      },
    );
  }
}


