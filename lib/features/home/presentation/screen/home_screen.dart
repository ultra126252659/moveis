import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/screen/tabs/explore_tab.dart';
import 'package:moves_final_project/features/home/presentation/screen/tabs/home_tab.dart';
import 'package:moves_final_project/features/home/presentation/screen/tabs/profile_tab.dart';
import 'package:moves_final_project/features/home/presentation/screen/tabs/search_tab.dart';
import 'package:moves_final_project/features/home/presentation/widget/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: ColorsApp.background,
        body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Stack(
                children: [
                  IndexedStack(
                    index: state.currentIndex,
                    children: [
                      HomeTab(),
                      SearchTab(),
                      ExploreTab(),
                      ProfileTab(),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomNavBar(),
                  ),
                ],
              );
            }
        ) ,
        // bottomNavigationBar: Container(
        //     height: 100,
        //   decoration: BoxDecoration(
        //      color: ColorsApp.surface,
        //
        //   ),
        //     child: BottomNavBar()),
      ),
    );
  }

}
