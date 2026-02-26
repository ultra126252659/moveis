import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:moves_final_project/features/details/presentation/screen/movie_details_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
part 'auto_route.gr.dart';
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true),
    AutoRoute(page: MovieDetailsRoute.page),
  ];
}