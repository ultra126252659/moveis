import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';

class SimilarItem extends StatelessWidget {
  const SimilarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
          child: Text(AppString.simialr,style: StyleApp.lgText,),

        ),
        GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.7,) ,
            itemCount:4,
            itemBuilder: (context, index){
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      ImageApp.bgHome,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 19, 18, 0.71),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 4),
                          ImageIcon(
                            AssetImage(IconApp.star),
                            color: ColorsApp.primaryGold,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
