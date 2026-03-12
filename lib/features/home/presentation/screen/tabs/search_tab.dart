import 'package:easy_localization/easy_localization.dart';
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
import 'dart:async';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  Timer? debounce;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final movies = state.moviesResponse?.data?.movies ?? [];
          final hasQuery = state.searchQuery != null && state.searchQuery!.isNotEmpty;

          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0.dg, vertical: 8.0.dg),
              color: ColorsApp.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: TextFormField(
                      onChanged: (query) {

                        if (debounce?.isActive ?? false) debounce!.cancel();

                        debounce = Timer(const Duration(milliseconds: 500), () {
                          context.read<HomeBloc>().add(GetSearchMoviesEvent(query));
                        });
                      },
                      cursorColor: ColorsApp.primaryGold,
                      style: StyleApp.mdText.copyWith(fontSize: 16.sp),
                      decoration: InputDecoration(
                        hintText: "search".tr(),
                        hintStyle: StyleApp.mdText,
                        prefixIcon: ImageIcon(
                          AssetImage(IconApp.icSearch),
                          color: ColorsApp.textPrimary,
                        ),
                        filled: true,
                        fillColor: ColorsApp.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0.dg, vertical: 12.0.dg),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),


                  Expanded(
                    child: (movies.isEmpty || !hasQuery || state.getMoviesStatus == RequestStatus.loading)
                        ? Center(child: Image.asset(ImageApp.empty))
                        : GridView.builder(
                      key: ValueKey(movies.hashCode),
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                      ),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return CardItem(
                          id: movie.id ?? 0,
                          width: MediaQuery.of(context).size.width * 0.37,
                          rating: movie.rating?.toDouble() ?? 0.0,
                          imageUrl: movie.mediumCoverImage ?? "",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}