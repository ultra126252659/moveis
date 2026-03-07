import 'package:auto_route/auto_route.dart';
import 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: MovieDetailsRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: MoviesIntroRoute.page),
    AutoRoute(page: Splashscreen.page),
  ];
}