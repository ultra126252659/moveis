import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/usecase/movies_explor_use_case.dart';
import 'package:moves_final_project/features/home/domain/usecase/movies_use_case.dart';
import 'package:moves_final_project/features/home/domain/usecase/search_movies_use_case.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';


@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesUseCase moviesUseCase;
  ExploreMoviesUseCase exploreMoviesUseCase;
  SearchMoviesUseCase searchMoviesUseCase;
  HomeBloc(this.moviesUseCase, this.searchMoviesUseCase, this.exploreMoviesUseCase) : super(HomeState()) {
    on<ChangeSelectedBottomNavBar>((event, emit) {
      emit(HomeState(currentIndex: event.index));
    });
    on<ChangeBackgroundEvent>((event, emit) {
      emit(state.copyWith(currentBackground: event.imageUrl));
    });
    on<GetMovies>((event, emit) async {
      emit(HomeState(getMoviesStatus: RequestStatus.loading));

      try {
        var response = await moviesUseCase("download_count");

        final movies = response.data?.movies ?? [];

        final genres = movies
            .expand<String>((m) => m.genres ?? <String>[])
            .toSet()
            .toList()
          ..sort();

        genres.insert(0, 'All');

        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          moviesResponse: response,
          allMovies: movies,
          filteredMovies: movies,
          genres: genres,
        ));
      } catch (e) {
        emit(HomeState(
          getMoviesStatus: RequestStatus.error,
          errorMassage: e.toString(),
        ));
      }
    });
    on<GetNewMovies>((event, emit) async {
      emit(HomeState(getMoviesStatus: RequestStatus.loading));

      try {
        var latestResponse = await moviesUseCase("year");

        emit(HomeState(
          getMoviesStatus: RequestStatus.success,
          moviesResponse: latestResponse,

        ));
      } catch (e) {
        emit(HomeState(
          getMoviesStatus: RequestStatus.error,
          errorMassage: e.toString(),
        ));
      }
    });

    on<SelectCategoryEvent>((event, emit) {
      final allMovies = state.allMovies;

      if (event.categoryName == 'All') {
        emit(state.copyWith(
          filteredMovies: allMovies,
          selectedCategory: 'All',
        ));
      } else {
        final filtered = allMovies
            .where((movie) =>
        movie.genres?.contains(event.categoryName) ?? false)
            .toList();

        emit(state.copyWith(
          filteredMovies: filtered,
          selectedCategory: event.categoryName,
        ));
      }
    });

    on<GetSearchMoviesEvent>((event, emit) async {
      if (event.query.isEmpty) {
        emit(state.copyWith(
          moviesResponse: null,
          isSearching: false,
          searchQuery: "",
          getMoviesStatus: RequestStatus.idle,
        ));
        return;
      }

      emit(state.copyWith(
        getMoviesStatus: RequestStatus.loading,
        searchQuery: event.query,
        isSearching: true,
      ));

      try {
        final response = await searchMoviesUseCase(event.query);
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          moviesResponse: response,
          searchQuery: event.query,
          isSearching: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.error,
          errorMassage: e.toString(),
          isSearching: false,
        ));
      }
    });
  }

}