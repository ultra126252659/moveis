import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class CardItem extends StatelessWidget {
  double rating;
  String imageUrl;
  double width;
  int id;
   CardItem({super.key,required this.id, required this.width, required this.rating, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(MovieDetailsRoute(movieId: id));
      },
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 230.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorsApp.primaryGold,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  ImageApp.bgHome,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: ColorsApp.shadow.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$rating",
                      style: StyleApp.smText,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: ColorsApp.primaryGold, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
