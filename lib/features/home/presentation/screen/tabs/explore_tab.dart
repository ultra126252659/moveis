import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/explore_item.dart';
import 'package:moves_final_project/features/home/presentation/widget/tab_bar.dart';

class ExploreTab extends StatelessWidget {

   ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(GetMovies()),
        child: BlocBuilder<HomeBloc, HomeState>(

        builder: (context, state) {
          if (state.getMoviesStatus == RequestStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.primaryGold,
              ),
            );
          }

          if (state.getMoviesStatus == RequestStatus.error) {
            return Center(
              child: Text(
                state.errorMassage ?? "Something went wrong",
                style: StyleApp.mdText,
              ),
            );
          }


          final genres = state.genres;
          final selectedCategory = state.selectedCategory;
            return SafeArea(
              child: Column(
                children: [
              
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.dg),
                    height: 60.h,
                    width: double.infinity,
              
                    child: TabBarItem(
                        onTap: (genre) {
                          context.read<HomeBloc>().add(
                            SelectCategoryEvent(categoryName: genre),
                          );
                        }, labels:genres,
                      selectedCategory: state.selectedCategory ?? 'All',

                    ),
                  ),

                  ExploreItem(),
                ],
              ),
            );

        },
      )
    );

  }
}
