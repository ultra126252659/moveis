import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class SuggestionsRepo {
  Future<MoviesResponse>getSuggestions(int id);
}