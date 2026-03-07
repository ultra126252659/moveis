import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

abstract class SuggestionsDs {
  Future<MoviesResponse>getSuggestions(int id);
}