import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

class DetailsState {
  RequestStatus? getDetailsMovies;
  RequestStatus? getSuggestionsMovies;
  MoviesResponse? moviesResponse;
  String? errorMassage;

  DetailsState(
      {this.getDetailsMovies = RequestStatus.init,
        this.getSuggestionsMovies = RequestStatus.init,
        this.moviesResponse,
        this.errorMassage,
      }
      );
  DetailsState copyWith({
    RequestStatus? getDetailsMovies,
    RequestStatus? getSuggestionsMovies,
    MoviesResponse? moviesResponse,
    String? errorMassage,}){
    return DetailsState(
      getDetailsMovies: getDetailsMovies ?? this.getDetailsMovies,
      getSuggestionsMovies: getSuggestionsMovies ?? this.getSuggestionsMovies,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,

    );
  }

}