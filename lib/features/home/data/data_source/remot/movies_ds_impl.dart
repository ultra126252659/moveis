
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/core/api/api_manager.dart';
import 'package:moves_final_project/core/api/end_point.dart';
import 'package:moves_final_project/features/home/data/data_source/remot/movies_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: MoviesRemoteDs)
class MoviesRemoteDsImpl implements MoviesRemoteDs{
  ApiManager apiManager;
  MoviesRemoteDsImpl(this.apiManager);
  @override
  Future<MoviesResponse> getMovies(String sortBy) async {
    try {
      var response = await apiManager.get(EndPoint.moviesList,
        queryParameters: {
          'sort_by': sortBy,
          'limit': 20,
        },
      );
      MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
      return moviesResponse;
    } catch (e) {
      rethrow;
    }
  }


}