import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/usecase/movies_use_case.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesUseCase moviesUseCase;
  HomeBloc(this.moviesUseCase) : super(HomeState()) {
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


  }

 }