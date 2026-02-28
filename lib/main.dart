import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/features/presentation/Screen/Onboarding.dart';
import 'package:moves_final_project/features/presentation/Screen/auth/login_screen.dart';
import 'package:moves_final_project/features/presentation/Screen/auth/register_screen.dart';
import 'package:moves_final_project/features/presentation/Screen/auth/reset_password_screen.dart';
import 'package:moves_final_project/features/presentation/Screen/splash_Screen.dart';
import 'package:moves_final_project/features/presentation/providers/auth_provider.dart';

import 'package:moves_final_project/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),

        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (c) => Splashscreen(),
        MoviesIntroScreen.routeName: (c) => MoviesIntroScreen(),
        LoginScreen.routeName: (c) => LoginScreen(),
        RegisterScreen.routeName: (c) => RegisterScreen(),
        ResetPasswordScreen.routeName: (c) => ResetPasswordScreen(),
    },
    );
  }
}


