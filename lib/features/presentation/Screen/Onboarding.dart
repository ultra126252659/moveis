import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moves_final_project/core/AppString.dart';
import 'package:moves_final_project/core/ImageApp.dart';
import 'package:moves_final_project/core/cache_helper.dart';
import 'package:moves_final_project/features/presentation/Screen/auth/login_screen.dart';




class MoviesIntroScreen extends StatelessWidget {
  static const String routeName = "MoviesIntroScreen";

  MoviesIntroScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final listRawPages = [
      _buildRawPage(
        imagePath: ImageApp.Onboarding1,
        title: AppString.titleOnboarding1,
        description: AppString.descriptionOnboarding1,
        primaryButtonText: "Explore Now",
        isFirstPage: true,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding2,
        title: AppString.titleOnboarding2,
        description: AppString.descriptionOnboarding2,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding3,
        title: AppString.titleOnboarding3,
        description: AppString.descriptionOnboarding3,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding4,
        title: AppString.titleOnboarding4,
        description: AppString.descriptionOnboarding4,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding5,
        title: AppString.titleOnboarding5,
        description: AppString.descriptionOnboarding5,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding6,
        title: AppString.titleOnboarding6,
        description: AppString.descriptionOnboarding6,
        primaryButtonText: "Finish",
        isLastPage: true,
        context: context,
      ),
    ];

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      rawPages: listRawPages,

      showBottomPart: false,
      safeAreaList: const [false, false, false, false],
      showDoneButton: false,
      showNextButton: false,
      showSkipButton: false,
      showBackButton: false,
      isProgress: false,

      done: const SizedBox.shrink(),
      next: const SizedBox.shrink(),
      onDone: () {},
    );
  }

  Widget _buildRawPage({
    required String imagePath,
    required String title,
    required String description,
    String primaryButtonText = "Next",
    bool isFirstPage = false,
    bool isLastPage = false,
    BuildContext? context,
  }) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 32),
            decoration: const BoxDecoration(
              color: Color(0xFF151515),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 15, height: 1.5),
                  ),
                ],
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isLastPage && context != null) {

                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                      } else {
                        introKey.currentState?.next();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      primaryButtonText,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                if (!isFirstPage) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        introKey.currentState?.previous();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFFC107), width: 1.5),
                        foregroundColor: const Color(0xFFFFC107),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        "Back",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}