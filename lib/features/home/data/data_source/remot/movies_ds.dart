import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class MoviesRemoteDs {
  Future<MoviesResponse> getMovies(String sortBy);


}