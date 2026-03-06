import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/details/data/source/remot/details_movies_ds.dart';
import 'package:moves_final_project/features/details/domain/repo/details_repo.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@Injectable(as: DetailsRepo)
class DetailsRepoImpl implements DetailsRepo{
  DetailsMoviesDs detailsMoviesDs;
  DetailsRepoImpl(this.detailsMoviesDs);
  @override
  Future<MoviesResponse> getDetailsMovies(int id)async {
   try{
     MoviesResponse response =await detailsMoviesDs.getDetailsMovies(id);
     return response;
   }catch(e){
     rethrow;
   }

  }
}