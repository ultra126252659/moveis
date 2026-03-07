import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class SearchMoviesRemoteDs {
  Future<MoviesResponse>getSearchMovies(String query);
}