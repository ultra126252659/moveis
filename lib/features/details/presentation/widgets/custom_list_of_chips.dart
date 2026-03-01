

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';

class ChipsListCustom extends StatelessWidget {
  ChipsListCustom({super.key});
  List<String> chipsIc =[IconApp.heart,IconApp.time,IconApp.star];
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SizedBox(
        height: 50.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: chipsIc.length,
          itemBuilder: (context, index) {
            return Chip(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: ColorsApp.textMuted,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    AssetImage(chipsIc[index]),
                    color: ColorsApp.primaryGold,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '15',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: 16),
        ),
      ),
    );
  }
}