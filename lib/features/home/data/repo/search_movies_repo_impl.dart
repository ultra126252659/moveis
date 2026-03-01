import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/data_source/remot/search_movies_remot_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/repo/search_movies_repo.dart';


@Injectable(as: SearchMoviesRepo)
class SearchMoviesRepoImpl implements SearchMoviesRepo{
  SearchMoviesRemoteDs searchMoviesRemoteDs;
  SearchMoviesRepoImpl(this.searchMoviesRemoteDs);

  @override
  Future<MoviesResponse> getSearchMovies(String query) async{
    try{
      var response =await searchMoviesRemoteDs.getSearchMovies(query);
      return response;
    }catch(e){
      rethrow;
    }

  }
}