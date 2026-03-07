import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class GenresItem extends StatelessWidget {
  List<String> genres;
  int count;
   GenresItem({super.key, required this.genres, required this.count });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Text(AppString.textGenres,
            style: StyleApp.lgText,),

        ),
        SizedBox(
          height: 150.h,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 2.3,) ,
              itemCount:count,
              itemBuilder: (context, index){
                String genre = genres[index].toString();
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorsApp.surface,
                  ),
                  child: Text(
                    genre,
                    textAlign: TextAlign.center,
                    style: StyleApp.mdText,),
                );
              }),
        ),
      ]
    );
  }
}
