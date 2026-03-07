
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/details/presentation/widgets/chip_item.dart';

class ChipsListCustom extends StatelessWidget {
  ChipsListCustom({super.key});
    @override
  Widget build(BuildContext context) {
    return   Center(
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            ChipItem(
              icon: IconApp.heart,
              count:5 ,

            )
          ],
        )
    )
    );
  }
}