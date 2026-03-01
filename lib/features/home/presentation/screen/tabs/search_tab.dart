import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});


  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.dg, vertical: 8.0.dg),
          color: ColorsApp.background,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10.h,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: TextFormField(
                controller: searchController,
                style: StyleApp.mdText,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: StyleApp.mdText,
                  prefixIcon:ImageIcon(AssetImage(IconApp.icSearch),
                  color: ColorsApp.textPrimary,
                  ),
                  filled: true,
                  fillColor: ColorsApp.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0.dg, vertical: 12.0.dg),
                )
              ),
            ),

            Expanded(
              child: Center(
                child: Image.asset(ImageApp.empty),
              ),
            )
          ],
        )
      ),
    );
  }
}
