
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

class ScreenShotList extends StatelessWidget {
  final Movies movie;


   ScreenShotList({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final List<String> screenshots = [
      movie.mediumScreenshotImage1 ?? '',
      movie.mediumScreenshotImage2 ?? '',
      movie.mediumScreenshotImage3 ?? '',
    ].where((url) => url.isNotEmpty).toList();

    if (screenshots.isEmpty) return const SizedBox.shrink();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Text(AppString.subTitleDetailsScreenShots,style: StyleApp.lgText,),

        ),
        SizedBox(
         height: 400.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: screenshots.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: screenshots[index],
                  height: 160.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 280.w,
                    color: ColorsApp.surface,
                    child: const Center(child: CircularProgressIndicator()),),
                  errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                ),
              );
              },
          ),
        ),

      ],
    );
  }
}
