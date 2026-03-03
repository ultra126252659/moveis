import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';
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
        autoPlay: true,
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
            return  CardItem(
              width: MediaQuery.of(context).size.width * 0.59,
              rating:  movie.rating ?? 0.0,
              imageUrl:  movie.mediumCoverImage ?? "",);

          },
        );
      }).toList(),
    );
  }
}