
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/onbording/presentation/Screen/Onboarding.dart';







@RoutePage()
class Splashscreen extends StatefulWidget {
  static const routeName="SplashScreen";
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  void initState() {
    super.initState();
    getNext();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color(0xFF121312),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              ImageApp.imagesplash,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),


          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Image.asset(ImageApp.imagebranding,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                const Text(
                  AppString.textSplash,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],


            ),
          ),

        ],
      ),


    );
  }

  void getNext() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      context.pushRoute(MoviesIntroRoute());
    });
  }
}
