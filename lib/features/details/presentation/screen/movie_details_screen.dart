


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/details/presentation/widgets/cast_item.dart';
import 'package:moves_final_project/features/details/presentation/widgets/cusotm_btn.dart';
import 'package:moves_final_project/features/details/presentation/widgets/custom_list_of_chips.dart';
import 'package:moves_final_project/features/details/presentation/widgets/genres_item.dart';
import 'package:moves_final_project/features/details/presentation/widgets/screen_shot_list.dart';
import 'package:moves_final_project/features/details/presentation/widgets/similar_gridView.dart';
import 'package:moves_final_project/features/details/presentation/widgets/summary_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  const  MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ColorsApp.background,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageApp.bgHome,width:double.infinity,height: 430.h,fit: BoxFit.cover,),
              Container(
                width: double.infinity,
                height: 430.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.8),
                    ]
                  )
                ),
              ),
              Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child:  ImageIcon(AssetImage(IconApp.arrowBack),color: Colors.white,size: 24,)
                        ),
                        GestureDetector(
                          onTap: (){},
                          child:  ImageIcon(AssetImage(IconApp.saveIc),color: Colors.white,size: 24,)
                        ),
                      ]
                    ),
                  )),
              Center(
                child: Image.asset(ImageApp.play,width: 97.w,height: 97.h,),
              ),
              Positioned(
                  bottom: 100,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),

                    child: Text(textAlign: TextAlign.center,AppString.filmName,style: StyleApp.lgText,),
                  )),
              Positioned(
                  bottom: 60.sp,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(textAlign: TextAlign.center,'2021',style: StyleApp.lgText,),
                  )),

            ],
          ),
            CustomBtn(text: 'watch', onPressed: () {  },),
            ChipsListCustom(),
            ScreenShotList(),
            SimilarItem(),
            SummaryItem(),
            CastItem(),
            GenresItem()
            ],
        )
        )
    );
  }
}

