import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';

import '../../../../core/resources/auto_route.dart';
class CourserScroll extends StatelessWidget {

  final List<dynamic> movies;

  const CourserScroll({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    if (movies.isEmpty) {
      return const SizedBox(
        height: 350,
        child: Center(child: CircularProgressIndicator(color: ColorsApp.primaryGold)),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,

        height: 350.0,
        aspectRatio: 16/9,
        viewportFraction: 0.6,
        onPageChanged: (index, reason) {
          final newImageUrl = movies[index].mediumCoverImage;
          context.read<HomeBloc>().add(ChangeBackgroundEvent(newImageUrl));
        },
      ),

      items: movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                context.pushRoute(const MovieDetailsRoute());
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          movie.mediumCoverImage ?? "", // رابط الصورة من الـ API
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(ImageApp.bgHome, fit: BoxFit.cover), // صورة احتياطية
                        ),
                      ),


                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                            color: ColorsApp.shadow.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${movie.rating ?? 0.0}", // التقييم الحقيقي
                                style: StyleApp.smText,
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.star, color: ColorsApp.primaryGold, size: 16),
                            ],
                          )
                      )
                    ],
                  )
              ),
            );
          },
        );
      }).toList(),
    );
  }
}