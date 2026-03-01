import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/usecase/movies_use_case.dart';
import 'package:moves_final_project/features/home/domain/usecase/search_movies_use_case.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';


@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesUseCase moviesUseCase;
  SearchMoviesUseCase searchMoviesUseCase;
  HomeBloc(this.moviesUseCase, this.searchMoviesUseCase) : super(HomeState()) {
    on<ChangeSelectedBottomNavBar>((event, emit) {
      emit(HomeState(currentIndex: event.index));
    });
    on<ChangeBackgroundEvent>((event, emit) {
      emit(state.copyWith(currentBackground: event.imageUrl));
    });
    on<GetMovies>((event, emit) async {
      emit(HomeState(getMoviesStatus: RequestStatus.loading));

      try {
        var latestResponse = await moviesUseCase("download_count");

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

    on<GetSearchMoviesEvent>((event, emit) async {
      emit(state.copyWith(
        getMoviesStatus: RequestStatus.loading,
        searchQuery: event.query,
      ));

      try {
        var response = await searchMoviesUseCase(event.query);
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.success,
          moviesResponse: response,
          searchQuery: event.query,
        ));
      } catch (e) {
        emit(state.copyWith(
          getMoviesStatus: RequestStatus.error,
          errorMassage: e.toString(),
        ));
      }
    });
  }

}