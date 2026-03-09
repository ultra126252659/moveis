// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:moves_final_project/features/auth/presentation/login_screen.dart'
    as _i2;
import 'package:moves_final_project/features/auth/presentation/register_screen.dart'
    as _i5;
import 'package:moves_final_project/features/auth/presentation/reset_password_screen.dart'
    as _i6;
import 'package:moves_final_project/features/details/presentation/screen/movie_details_screen.dart'
    as _i3;
import 'package:moves_final_project/features/home/presentation/screen/home_screen.dart'
    as _i1;
import 'package:moves_final_project/features/onbording/presentation/Screen/Onboarding.dart'
    as _i4;
import 'package:moves_final_project/features/onbording/presentation/Screen/splash_Screen.dart'
    as _i7;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i1.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.MovieDetailsScreen]
class MovieDetailsRoute extends _i8.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i9.Key? key,
    required int movieId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         MovieDetailsRoute.name,
         args: MovieDetailsRouteArgs(key: key, movieId: movieId),
         initialChildren: children,
       );

  static const String name = 'MovieDetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i3.MovieDetailsScreen(key: args.key, movieId: args.movieId);
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final _i9.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && movieId == other.movieId;
  }

  @override
  int get hashCode => key.hashCode ^ movieId.hashCode;
}

/// generated route for
/// [_i4.MoviesIntroScreen]
class MoviesIntroRoute extends _i8.PageRouteInfo<MoviesIntroRouteArgs> {
  MoviesIntroRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        MoviesIntroRoute.name,
        args: MoviesIntroRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'MoviesIntroRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MoviesIntroRouteArgs>(
        orElse: () => const MoviesIntroRouteArgs(),
      );
      return _i4.MoviesIntroScreen(key: args.key);
    },
  );
}

class MoviesIntroRouteArgs {
  const MoviesIntroRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'MoviesIntroRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MoviesIntroRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordRoute extends _i8.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        ResetPasswordRoute.name,
        args: ResetPasswordRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ResetPasswordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>(
        orElse: () => const ResetPasswordRouteArgs(),
      );
      return _i6.ResetPasswordScreen(key: args.key);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i7.Splashscreen]
class Splashscreen extends _i8.PageRouteInfo<void> {
  const Splashscreen({List<_i8.PageRouteInfo>? children})
    : super(Splashscreen.name, initialChildren: children);

  static const String name = 'Splashscreen';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.Splashscreen();
    },
  );
}
