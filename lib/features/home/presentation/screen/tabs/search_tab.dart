import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moves_final_project/core/resources/app_string.dart';
import 'package:moves_final_project/core/resources/colors_app.dart';
import 'package:moves_final_project/core/resources/image&icon.dart';
import 'package:moves_final_project/core/resources/style_app.dart';
import 'package:moves_final_project/di.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
import 'package:moves_final_project/features/home/presentation/widget/card_item.dart';


class SearchTab extends StatelessWidget {
  SearchTab({super.key});


  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child:BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("Current Query: ${state.searchQuery}");
          print("Movies Count: ${state.moviesResponse?.data?.movies?.length}");
          return SafeArea(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.dg, vertical: 8.0.dg),
                  color: ColorsApp.background,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 10.h,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: TextFormField(
                            onChanged: (value) {
                              context.read<HomeBloc>().add(GetSearchMoviesEvent(value));
                            },
                            controller: searchController,
                            style: StyleApp.mdText,
                            decoration: InputDecoration(
                              hintText: AppString.search,
                              hintStyle: StyleApp.mdText,
                              prefixIcon:ImageIcon(AssetImage(IconApp.icSearch),
                                color: ColorsApp.textPrimary,
                              ),
                              filled: true,
                              fillColor: ColorsApp.surface,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.0.dg, vertical: 12.0.dg),
                            )
                        ),
                      ),

                      Expanded(
                        child:(state.searchQuery == null || state.searchQuery!.isEmpty)
                            ? Center(child: Image.asset(ImageApp.empty))
                            : GridView.builder(
                          key: ValueKey(state.searchQuery),
                          itemCount: state.moviesResponse?.data?.movies?.length ?? 0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 15.h,
                            crossAxisSpacing: 15.w,

                          ),
                          itemBuilder: (context, index) {
                            var movie = state.moviesResponse?.data?.movies?[index];
                            return CardItem(
                              rating: movie?.rating?.toDouble() ?? 0.0,
                              imageUrl: movie?.mediumCoverImage ?? "",
                            );
                          },
                        )
                      )
                    ],
                  )
              ),
            );
        }
      ),
    );
  }
}
