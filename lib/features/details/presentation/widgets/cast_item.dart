import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key});

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
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          ImageApp.byDetails,
                          width: 60.w,
                          height: 50.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          Text("Name : Hayley Atwell",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: StyleApp.mdText,),
                          Text("Character : Captain Carter",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            style: StyleApp.smText),
                        ],
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
