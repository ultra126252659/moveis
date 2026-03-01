import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';
import 'package:moves_final_project/features/home/presentation/widget/tab_bar.dart';

class ExploreTab extends StatelessWidget {

  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(

          );
        },
        listener: (context, state) {
          if (state.getMoviesStatus == RequestStatus.loading) {

          }
          if (state.getMoviesStatus == RequestStatus.error) {


          }
        }
      ),
    );
  }
}
