import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';


class CastItem extends StatelessWidget {
  final List<Cast> castList;
   CastItem({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Text(AppString.textCast,
            style: StyleApp.lgText,),

        ),
        SizedBox(
          height: 250.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,index){
                final actor = castList[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorsApp.surface,
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl:actor.urlSmallImage ?? '',
                          height: 50.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator(
                            color: ColorsApp.primaryGold,
                          )),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${actor.name ?? 'Unknown'}",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: StyleApp.smText,),
                            Text("Character : ${actor.characterName ?? ''}",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines:  1,
                              style: StyleApp.smText.copyWith(
                                fontSize: 14.sp,
                              ),)
                          ],
                        ),
                      )
                    ],
                  )
                );
              },
            separatorBuilder: (context,index) {
                return SizedBox(height: 15,);
                },
          ),

        )
      ],
    );
  }
}
