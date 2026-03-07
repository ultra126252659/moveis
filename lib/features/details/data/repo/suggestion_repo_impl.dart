import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/details/data/source/remot/suggestions_ds.dart';
import 'package:moves_final_project/features/details/domain/repo/suggestions_repo.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: SuggestionsRepo)
class SuggestionRepoImpl implements SuggestionsRepo{
  SuggestionsDs suggestionsDs;
  SuggestionRepoImpl(this.suggestionsDs);
  @override
  Future<MoviesResponse> getSuggestions(int id) async{
   try{
     var response = await suggestionsDs.getSuggestions(id);
     return response;
   }catch(e){
     rethrow;
   }

  }
}