import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/data_source/remot/movies_ds.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/repo/move_repo.dart';

@Injectable(as: MoviesRepo)
class MoviesRepoImpl implements MoviesRepo{
  MoviesRemoteDs moviesRemoteDs;
  MoviesRepoImpl(this.moviesRemoteDs);

  @override
  Future<MoviesResponse> getMovies(String sortBy)async {
    try{
      MoviesResponse response =await moviesRemoteDs.getMovies(sortBy);
      return response;
    }catch(e){
      rethrow;
    }
  }



}