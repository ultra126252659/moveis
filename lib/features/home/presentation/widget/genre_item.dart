
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/auto_route.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';
class ActionItem extends StatelessWidget {
  String title;
  final List<dynamic> movies;
  ActionItem({super.key, required this.title,required this.movies});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: StyleApp.mdText),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      AppString.supTitleHome,
                      style: StyleApp.smText.copyWith(color: ColorsApp.primaryGold),
                    ),
                    const Icon(Icons.arrow_forward, color: ColorsApp.primaryGold),
                  ],
                ),
              ),
            ],
          ),
        ),


        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.37,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CardItem(
                    id: movie.id ?? 0,
                    width: 0.37,
                    rating: movie.rating?.toDouble() ?? 0.0,
                    imageUrl: movie.mediumCoverImage ?? ""),
              );
            },
          ),
        ),
      ],
    );
  }
}