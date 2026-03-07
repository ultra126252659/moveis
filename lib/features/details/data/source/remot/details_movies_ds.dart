import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class DetailsMoviesDs {
  Future<MoviesResponse> getDetailsMovies(int id);
}