


import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/auto_route.gr.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/firebase_functions.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_bloc.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_event.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_state.dart';
import 'package:moves_final_project/features/details/presentation/widgets/cast_item.dart';
import 'package:moves_final_project/features/details/presentation/widgets/chip_item.dart';
import 'package:moves_final_project/features/details/presentation/widgets/cusotm_btn.dart';
import 'package:moves_final_project/features/details/presentation/widgets/custom_list_of_chips.dart';
import 'package:moves_final_project/features/details/presentation/widgets/genres_item.dart';
import 'package:moves_final_project/features/details/presentation/widgets/screen_shot_list.dart';
import 'package:moves_final_project/features/details/presentation/widgets/similar_gridView.dart';
import 'package:moves_final_project/features/details/presentation/widgets/summary_item.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<DetailsBloc>()..add(GetDetailsEvent(movieId)),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {},
          builder: (context, state) {
            if(state.getDetailsMovies == RequestStatus.loading){
              return const Center(child: CircularProgressIndicator(
                color: ColorsApp.primaryGold,
              ));
            }

            if(state.getDetailsMovies == RequestStatus.error){
              return Center(child: Text(state.errorMassage ?? 'something went wrong'));
            }

            final movie = state.moviesResponse?.data?.movie;


            if(movie == null){
              return const Center(child: Text('no data'));
            }

            return Scaffold(
              backgroundColor: ColorsApp.background,
              extendBodyBehindAppBar: true,
              body: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: movie.largeCoverImage ?? '',
                          height: 430.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator(
                            color: ColorsApp.primaryGold,
                          )),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
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
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 16,
                          right: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: (){
                                    context.pushRoute(HomeRoute());
                                  },
                                  icon:  ImageIcon(
                                    AssetImage(IconApp.arrowBack),
                                    color: ColorsApp.textPrimary,size: 30,)
                                ,),
                              IconButton(
                                onPressed: () async {

                                  Map<String, dynamic> movieData = {
                                    "id": movie.id,
                                    "title": movie.title,
                                    "rating": movie.rating,
                                    "year": movie.year,
                                    "poster": movie.largeCoverImage,

                                  };

                                  await FirebaseFunctions.addToHistory(movieData);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Added to WatchList")),
                                  );

                                },
                                  icon:   ImageIcon(
                                    AssetImage(IconApp.saveIc),
                                    color: ColorsApp.textPrimary,size: 30,),
                              )

                            ]
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          left: 16,
                          right: 16,
                          child: Text(
                            textAlign: TextAlign.center,
                            movie.title ?? '',
                            style: StyleApp.lgText,
                          ),
                        ),
                        Positioned(
                          bottom: 50.sp,
                          left: 16,
                          right: 16,
                          child: Text(
                            textAlign: TextAlign.center,
                            '${movie.year}',
                            style: StyleApp.lgText,
                          ),
                        ),
                      ],
                    ),
                    CustomBtn(text: 'watch',
                        onPressed: () async {

                      Map<String, dynamic> movieData = {
                        "id": movie.id,
                        "title": movie.title,
                        "rating": movie.rating,
                        "year": movie.year,
                        "poster": movie.largeCoverImage,

                      };

                      await FirebaseFunctions.addToWatchList(movieData);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to History")),
                      );

                    },),
                 Row(
                   spacing: 10,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ChipItem(
                         count: movie.likeCount ?? 0,
                         icon: IconApp.heart
                     ),
                     ChipItem(
                         count: movie.runtime?.toInt() ?? 0,
                         icon: IconApp.time
                     ),
                     ChipItem(
                         count: movie.rating ?? 0.0,
                         icon: IconApp.star
                     )
                   ],
                 ),
                    ScreenShotList(
                        movie: movie
                    ),
                    SimilarItem(
                      id: movie.id ?? 0,
                    ),
                    SummaryItem(summary: movie.descriptionFull ?? '',),
                    CastItem( castList: movie.cast ?? [],),
                    GenresItem(genres: movie.genres ?? [],
                      count: movie.genres?.length ?? 0,),
                  ],
                ),
              ),
            );
          },),
    );
  }
}

