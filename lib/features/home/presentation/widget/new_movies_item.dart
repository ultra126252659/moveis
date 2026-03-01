import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/courser_scroll.dart';

class NewMoviesItem extends StatelessWidget {
  const NewMoviesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(GetNewMovies()),
      child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state){

        return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (state.currentBackground != null && state.currentBackground!.isNotEmpty)
                    ? NetworkImage(state.currentBackground!)
                    : AssetImage(ImageApp.bgHome) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child:Stack(
                children: [
                  Container(
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
                  ),
                  Column(
                      children: [
                        SizedBox(
                            height: 100,
                            child: Center(
                              child: Image.asset(IconApp.headerText, width: 200,),
                            )
                        ),
                        CourserScroll(
                          movies: state.moviesResponse?.data?.movies ?? [],
                        ),
                        SizedBox(
                            height: 120,
                            child: Center(
                              child: Image.asset(IconApp.bottomText, width: 300,),
                            )
                        ),
                      ]
                  ),

                ]
            )

        );
      }),
    );
  }
}
