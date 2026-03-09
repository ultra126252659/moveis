import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

class TabBarItem extends StatelessWidget {
  final List<String> labels;
  final Function(String) onTap;
  final String selectedCategory;
  const TabBarItem({
    super.key,
    required this.labels,
    required this.onTap,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          itemCount: labels.length,
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          itemBuilder: (context, index) {
            final genre = labels[index];
            final isSelected = selectedCategory == genre; // ✅ استخدم المتغير المرسل

            return GestureDetector(
              onTap: () => onTap(genre),
              child: Chip(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                backgroundColor:
                isSelected ? ColorsApp.primaryGold : ColorsApp.background,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: ColorsApp.primaryGold, width: 2.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                label: Text(
                  genre,
                  style: StyleApp.smText.copyWith(
                    color: isSelected ? ColorsApp.background : ColorsApp.primaryGold,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}