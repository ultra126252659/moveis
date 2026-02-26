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
import 'features/home/data/data_source/remot/movies_ds.dart' as _i950;
import 'features/home/data/data_source/remot/movies_ds_impl.dart' as _i1050;
import 'features/home/data/repo/movies_repo_impl.dart' as _i558;
import 'features/home/domain/repo/move_repo.dart' as _i1064;
import 'features/home/domain/usecase/movies_use_case.dart' as _i1064;
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
    gh.factory<_i1064.MoviesRepo>(
      () => _i558.MoviesRepoImpl(gh<_i950.MoviesRemoteDs>()),
    );
    gh.factory<_i1064.MoviesUseCase>(
      () => _i1064.MoviesUseCase(gh<_i1064.MoviesRepo>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(gh<_i1064.MoviesUseCase>()),
    );
    return this;
  }
}
