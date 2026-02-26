import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/widget/action_item.dart';
import 'package:moves_final_project/features/home/presentation/widget/courser_scroll.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.5),
                  ColorsApp.background
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageApp.bgHome),
                    fit: BoxFit.cover,
                  ),

                ),
                child:Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.5),
                                ColorsApp.background
                              ]
                          )
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: Image.asset(IconApp.headerText, width: 200,),
                          )
                        ),
                        CourserScroll(),
                        SizedBox(
                            height: 120,
                            child: Center(
                              child: Image.asset(IconApp.bottomText, width: 300,),
                            )
                        ),
                      ]
                    ),

                  ]
                )

              ),
              Container(
                child: ActionItem(),
              )
            ]
          )
        ),
      ),
    );
  }
}
