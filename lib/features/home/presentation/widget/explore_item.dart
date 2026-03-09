import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final movies = state.filteredMovies;
        print("selectedCategory: ${state.selectedCategory}");

        if(state.getMoviesStatus == RequestStatus.loading){
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsApp.primaryGold,
            ),
          );
        }
        if(state.getMoviesStatus == RequestStatus.error){
          return Center(
            child: Text(state.errorMassage!,
              style: StyleApp.mdText,
            ));

        }
        return  Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10.r),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.7,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return CardItem(
                id: movies[index].id ?? 0,
                width: MediaQuery.of(context).size.width * 0.37,
                rating: movies[index].rating?.toDouble() ?? 0.0,
                imageUrl: movies[index].mediumCoverImage ?? '',
              );
            },
          ),
        );
      }

    );
  }
}
