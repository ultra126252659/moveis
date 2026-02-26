import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/domain/usecase/movies_use_case.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MoviesUseCase moviesUseCase;
  HomeBloc(this.moviesUseCase) : super(HomeState()){
    on<ChangeSelectedBottomNavBar>((event, emit) {
      emit(HomeState(currentIndex: event.index));
    });
    on<ChangeBackgroundEvent>((event, emit) {
      emit(state.copyWith(currentBackground: event.imageUrl));
    });
    on<GetMovies>((event, emit) async {

      emit(HomeState(getMoviesStatus: RequestStatus.loading));

      try {
           final results = await Future.wait([
          moviesUseCase.call("year"),
          moviesUseCase.call("download_count"),
        ]);

        final latestResponse = results[0];
        final popularResponse = results[1];

        emit(HomeState(
          getMoviesStatus: RequestStatus.success,
          latestMoviesResponse: latestResponse,
          popularMoviesResponse: popularResponse,
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