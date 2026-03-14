
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/auth/presentation/login_screen.dart';



@RoutePage()
class MoviesIntroScreen extends StatelessWidget {


  MoviesIntroScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final listRawPages = [
      _buildRawPage(
        imagePath: ImageApp.Onboarding1,
        title: "titleOnboarding1".tr(),
        description: "descriptionOnboarding1".tr(),
        primaryButtonText: "text Explore Now".tr(),
        isFirstPage: true,
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding2,
        title:"titleOnboarding2".tr(),
        description:"descriptionOnboarding2".tr(),
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding3,
        title: "titleOnboarding3".tr(),
        description:"descriptionOnboarding3".tr(),
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding4,
        title:"titleOnboarding4".tr(),
        description:"descriptionOnboarding4".tr(),
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding5,
        title:"titleOnboarding5".tr(),
        description: "descriptionOnboarding5".tr(),
      ),
      _buildRawPage(
        imagePath: ImageApp.Onboarding6,
        title:"titleOnboarding6".tr(),
        description:"descriptionOnboarding6".tr(),
        primaryButtonText: "text Finish".tr(),
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

                        context.pushRoute(LoginRoute());

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
                        "text Back",
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