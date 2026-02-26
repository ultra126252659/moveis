import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class MoviesRepo{
 Future<MoviesResponse>getMovies(String sortBy);
}
