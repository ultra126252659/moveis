import 'package:injectable/injectable.dart';
import 'package:moves_final_project/core/api/api_manager.dart';
import 'package:moves_final_project/core/api/end_point.dart';
import 'package:moves_final_project/features/details/data/source/remot/suggestions_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: SuggestionsDs)
class SuggestionsDsImpl implements SuggestionsDs{
  ApiManager apiManager;
  SuggestionsDsImpl (this.apiManager);
  @override
  Future<MoviesResponse> getSuggestions(int id) async{
    try{
      var response = await apiManager.get(EndPoint.suggestions,
        queryParameters: {
          'movie_id':id,
        });
      MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
      return moviesResponse;
    }catch(e){
      rethrow;
    }

  }
}