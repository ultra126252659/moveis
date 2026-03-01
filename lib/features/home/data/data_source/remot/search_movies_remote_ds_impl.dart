import 'package:injectable/injectable.dart';
import 'package:moves_final_project/core/api/api_manager.dart';
import 'package:moves_final_project/core/api/end_point.dart';
import 'package:moves_final_project/features/home/data/data_source/remot/search_movies_remot_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: SearchMoviesRemoteDs)
class SearchMoviesRemoteDsImpl implements SearchMoviesRemoteDs{
  ApiManager apiManager;
  SearchMoviesRemoteDsImpl(this.apiManager);

  @override
  Future<MoviesResponse> getSearchMovies(String query) async{
    try{
      var response = await apiManager.get(EndPoint.moviesList,
      queryParameters: {"query":query,"limit":20}
      );
      MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
      return moviesResponse;

    }catch(e){
      rethrow;
    }

  }
}