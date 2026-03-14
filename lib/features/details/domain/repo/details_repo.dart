import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class DetailsRepo{
  Future<MoviesResponse> getDetailsMovies(int id);
}