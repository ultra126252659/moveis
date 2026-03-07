import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_bloc.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_event.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_state.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';

class SimilarItem extends StatelessWidget {
   int id;
   SimilarItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>()..add(GetSuggestionsEvent(id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
            child: Text(AppString.simialr,style: StyleApp.lgText,),

          ),
          BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                final movies = state.moviesResponse?.data?.movies ?? [];
                if (state.getSuggestionsMovies == RequestStatus.loading) {
                  return const Center(child: CircularProgressIndicator(
                    color: ColorsApp.primaryGold,
                  ));
                }
                if (state.getSuggestionsMovies == RequestStatus.error) {
                  return Center(child: Text(state.errorMassage ?? ''));
                }
                if (state.getSuggestionsMovies == RequestStatus.success) {
                  return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.7,) ,
                      itemCount:movies.length,
                      itemBuilder: (context, index){
                        var movie = movies[index];
                        return CardItem(
                          id: movie.id ?? 0,
                            width: 0.37,
                            rating: movie.rating ?? 0.0,
                            imageUrl: movie.mediumCoverImage ?? '',
                        );
                      });
                }
                return  SizedBox();
              }
          )
        ],
      ),
    );
  }
}
