import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class SearchMoviesRepo {
  Future<MoviesResponse>getSearchMovies(String query);
}