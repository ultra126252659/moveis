import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class CardItem extends StatelessWidget {
  double rating;
  String imageUrl;

   CardItem({super.key, required this.rating, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              imageUrl,
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) =>
                  Image.asset(ImageApp.bgHome, fit: BoxFit.cover),
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
                    "${rating}",
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
    );
  }
}
