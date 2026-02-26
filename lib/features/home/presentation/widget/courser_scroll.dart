import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class CourserScroll extends StatelessWidget {
  const CourserScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: 350.0,
        aspectRatio: 16/9,
        viewportFraction: 0.6,

      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                       ImageApp.bgHome,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 30,
                      width: 65,
                      decoration: BoxDecoration(
                        color: ColorsApp.shadow.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("7.7", style:StyleApp.smText,),
                          Icon(Icons.star, color: ColorsApp.primaryGold,),
                        ]
                      )
                    )
                  ],
                )
            );
          },
        );
      }).toList(),
    );
  }
}
