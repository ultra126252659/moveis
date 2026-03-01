
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/genre_item.dart';
import 'package:moves_final_project/features/home/presentation/widget/courser_scroll.dart';
import 'package:moves_final_project/features/home/presentation/widget/new_movies_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(GetMovies()),
      child: BlocBuilder<HomeBloc, HomeState>(

        builder: (context, state) {

          if (state.getMoviesStatus == RequestStatus.loading) {
            return const Center(child: CircularProgressIndicator(
              color: ColorsApp.primaryGold,
            ));
          }
          final popularMovies = state.moviesResponse?.data?.movies ?? [];
          final allGenres = popularMovies
              .expand((m) => m.genres ?? <String>[])
              .toSet().toList()..sort();

          return  SafeArea(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.5),
                        ColorsApp.background
                      ]
                  )
              ),
              child: SingleChildScrollView(
                  child: Column(
                      children: [
                        NewMoviesItem(),
                        ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final String genre = allGenres[index];
                              final categoryMovies = popularMovies
                                  .where((m) => m.genres?.contains(genre) ?? false)
                                  .toList();
                              return ActionItem(
                                title: genre,
                                movies: categoryMovies,
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 20),
                            itemCount: allGenres.length)
                      ]
                  )
              ),
            ),
          );
        }

      ),
    );
  }
}
