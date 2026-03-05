
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class ScreenShotList extends StatelessWidget {
  const ScreenShotList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Text(AppString.subTitleDetailsScreenShots,style: StyleApp.lgText,),

        ),
        Container(
         height: 400.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return   ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    ImageApp.byDetails,fit: BoxFit.cover,)
                  ,
                );
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 15,);},
              itemCount: 3),
        ),
      ],
    );
  }
}
