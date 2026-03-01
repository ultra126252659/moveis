
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/details/presentation/widgets/cusotm_btn.dart';
import 'package:moves_final_project/features/details/presentation/widgets/custom_list_of_chips.dart';
import 'package:moves_final_project/features/details/presentation/widgets/screen_shot_list.dart';
import 'package:moves_final_project/features/details/presentation/widgets/similar_gridView.dart';


class MovieDetailsScreen extends StatelessWidget {
  const  MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: ColorsApp.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyActions: false,
          leadingWidth: 50,
automaticallyImplyLeading: false,
          title: GestureDetector(onTap: (){},
              child: ImageIcon(AssetImage(IconApp.arrowBack),color: Colors.white,size: 24,)),
          actions: [ImageIcon(AssetImage(IconApp.saveIc),color: Colors.white,),SizedBox(width: 15,)],),
        body: SingleChildScrollView(child: Column(

         crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(ImageApp.bgHome,width: 430.w,height: 630.h,fit: BoxFit.cover,),

              Center(
                child: Image.asset(ImageApp.play,width: 97.w,height: 97.h,),
              ),
              Positioned(
                  bottom: 100,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(textAlign: TextAlign.center,AppString.supTitleHome,style: StyleApp.lgText,),
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
          SizedBox(height: 15.h,),
            ChipsListCustom(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.supTitleHome,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            ScreenShotList(),
            SizedBox(height: 9.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.supTitleHome,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            CusctomGridView(),
            SizedBox(height: 9.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(AppString.supTitleHome,style: StyleApp.lgText,),
            ),SizedBox(height: 1.h,),
            Text(

                style:StyleApp.smText.copyWith(letterSpacing: 0) ,'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346')
            ],)));
  }
}

