import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class HomeState {
  RequestStatus? getMoviesStatus;
  MoviesResponse? moviesResponse;
  String? errorMassage;
  MoviesResponse? latestMoviesResponse;
  MoviesResponse? popularMoviesResponse;
  int? currentIndex;
  String? currentBackground;
  HomeState({
    this.getMoviesStatus = RequestStatus.init,
    this.latestMoviesResponse,
    this.popularMoviesResponse,
    this.moviesResponse,
    this.errorMassage,
    this.currentBackground,
    this.currentIndex = 0});

  HomeState copyWith({
    RequestStatus? getMoviesStatus,
    MoviesResponse? moviesResponse,
    String? errorMassage,
    String? currentBackground,}){
    return HomeState(
      getMoviesStatus: getMoviesStatus ?? this.getMoviesStatus,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      latestMoviesResponse: latestMoviesResponse ?? latestMoviesResponse,
      popularMoviesResponse: popularMoviesResponse ?? popularMoviesResponse,
      currentBackground: currentBackground ?? this.currentBackground,
    );
  }
}