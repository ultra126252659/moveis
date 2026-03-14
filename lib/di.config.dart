// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/details/data/repo/details_repo_impl.dart' as _i894;
import 'features/details/data/repo/suggestion_repo_impl.dart' as _i296;
import 'features/details/data/source/remot/details_movies_ds.dart' as _i528;
import 'features/details/data/source/remot/details_movies_ds_impl.dart' as _i28;
import 'features/details/data/source/remot/suggestions_ds.dart' as _i974;
import 'features/details/data/source/remot/suggestions_ds_impl.dart' as _i986;
import 'features/details/domain/repo/details_repo.dart' as _i700;
import 'features/details/domain/repo/suggestions_repo.dart' as _i556;
import 'features/details/domain/use_Case/details_use_case.dart' as _i550;
import 'features/details/domain/use_Case/suggestions_use_case.dart' as _i140;
import 'features/details/presentation/bloc/details_bloc.dart' as _i399;
import 'features/home/data/data_source/remot/movies_ds.dart' as _i950;
import 'features/home/data/data_source/remot/movies_ds_impl.dart' as _i1050;
import 'features/home/data/data_source/remot/search_movies_remot_ds.dart'
    as _i814;
import 'features/home/data/data_source/remot/search_movies_remote_ds_impl.dart'
    as _i286;
import 'features/home/data/repo/movies_repo_impl.dart' as _i558;
import 'features/home/data/repo/search_movies_repo_impl.dart' as _i24;
import 'features/home/domain/repo/move_repo.dart' as _i1064;
import 'features/home/domain/repo/search_movies_repo.dart' as _i1069;
import 'features/home/domain/usecase/movies_explor_use_case.dart' as _i491;
import 'features/home/domain/usecase/movies_use_case.dart' as _i1064;
import 'features/home/domain/usecase/search_movies_use_case.dart' as _i532;
import 'features/home/presentation/bloc/home_bloc.dart' as _i123;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i950.MoviesRemoteDs>(
      () => _i1050.MoviesRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i528.DetailsMoviesDs>(
      () => _i28.DetailsMoviesDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i814.SearchMoviesRemoteDs>(
      () => _i286.SearchMoviesRemoteDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i974.SuggestionsDs>(
      () => _i986.SuggestionsDsImpl(gh<_i237.ApiManager>()),
    );
    gh.factory<_i1064.MoviesRepo>(
      () => _i558.MoviesRepoImpl(gh<_i950.MoviesRemoteDs>()),
    );
    gh.factory<_i491.ExploreMoviesUseCase>(
      () => _i491.ExploreMoviesUseCase(gh<_i1064.MoviesRepo>()),
    );
    gh.factory<_i1064.MoviesUseCase>(
      () => _i1064.MoviesUseCase(gh<_i1064.MoviesRepo>()),
    );
    gh.factory<_i700.DetailsRepo>(
      () => _i894.DetailsRepoImpl(gh<_i528.DetailsMoviesDs>()),
    );
    gh.factory<_i1069.SearchMoviesRepo>(
      () => _i24.SearchMoviesRepoImpl(gh<_i814.SearchMoviesRemoteDs>()),
    );
    gh.factory<_i556.SuggestionsRepo>(
      () => _i296.SuggestionRepoImpl(gh<_i974.SuggestionsDs>()),
    );
    gh.factory<_i550.DetailsUseCase>(
      () => _i550.DetailsUseCase(gh<_i700.DetailsRepo>()),
    );
    gh.factory<_i140.SuggestionsUseCase>(
      () => _i140.SuggestionsUseCase(gh<_i556.SuggestionsRepo>()),
    );
    gh.factory<_i399.DetailsBloc>(
      () => _i399.DetailsBloc(
        gh<_i550.DetailsUseCase>(),
        gh<_i140.SuggestionsUseCase>(),
      ),
    );
    gh.factory<_i532.SearchMoviesUseCase>(
      () => _i532.SearchMoviesUseCase(gh<_i1069.SearchMoviesRepo>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(
        gh<_i1064.MoviesUseCase>(),
        gh<_i532.SearchMoviesUseCase>(),
        gh<_i491.ExploreMoviesUseCase>(),
      ),
    );
    return this;
  }
}
