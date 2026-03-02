import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

class TabBarItem extends StatelessWidget {
  List<String> label;
  int count;
  TabBarItem({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder:  (context, state) {
          return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Chip(

                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      backgroundColor:state.selectedCategory == label[index] ? ColorsApp.primaryGold : ColorsApp.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorsApp.primaryGold, width: 2.w),
                        borderRadius: BorderRadius.circular(10.0.dg),
                      ),
                      label: Text(label[index],
                          style: StyleApp.smText.copyWith(
                              color: state.selectedCategory == label[index] ? ColorsApp.background : ColorsApp.primaryGold,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                          ),
                      )),
                );
                },
              separatorBuilder: (context, index) =>  SizedBox(width: 8.w),
              itemCount: count);
        },
        listener: (context, state) {});
  }
}
