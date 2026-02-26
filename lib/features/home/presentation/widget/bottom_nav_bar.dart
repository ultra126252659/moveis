import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 65,
          margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
            color: ColorsApp.background,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, IconApp.icHome, state.currentIndex == 0, 0),
              _buildNavItem(context, IconApp.icSearch, state.currentIndex == 1, 1),
              _buildNavItem(context, IconApp.icExplore, state.currentIndex == 2, 2),
              _buildNavItem(context, IconApp.icProfile, state.currentIndex == 3, 3),
            ],
          ),
        );
      }
    );


  }

  Widget _buildNavItem(BuildContext context, String iconPath, bool isActive, int index) {
    return InkWell(
      onTap: () {
        BlocProvider.of<HomeBloc>(context).add(ChangeSelectedBottomNavBar(index));
      },
      child: ImageIcon(
        AssetImage(iconPath),
        size: 28,
        color: isActive ? ColorsApp.primaryGold : ColorsApp.textMuted,
      ),
    );
  }

}
