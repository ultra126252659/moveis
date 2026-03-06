import 'package:injectable/injectable.dart';
import 'package:moves_final_project/core/api/api_manager.dart';
import 'package:moves_final_project/core/api/end_point.dart';
import 'package:moves_final_project/features/details/data/source/remot/details_movies_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: DetailsMoviesDs)
class DetailsMoviesDsImpl implements DetailsMoviesDs {
  ApiManager apiManager;
  DetailsMoviesDsImpl (this.apiManager);
  @override
  Future<MoviesResponse> getDetailsMovies(int id) async{
   try{
     var response =await apiManager.get(EndPoint.movieDetails,
       queryParameters: {
         'movie_id':id,
         'with_images':true,
         'with_cast':true,
       }
     );
     MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
     return moviesResponse;
   }catch(e){
     rethrow;
   }
  }
 }