import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/details/domain/repo/suggestions_repo.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@injectable
class SuggestionsUseCase {
  SuggestionsRepo suggestionsRepo;
  SuggestionsUseCase(this.suggestionsRepo);
  Future<MoviesResponse> call(int id) async {
    return await suggestionsRepo.getSuggestions(id);
  }
}