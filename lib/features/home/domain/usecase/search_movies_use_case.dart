import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/repo/search_movies_repo.dart';

@injectable
class SearchMoviesUseCase {
  SearchMoviesRepo searchMoviesRepo;
  SearchMoviesUseCase(this.searchMoviesRepo);
  Future<MoviesResponse> call(String query) async {
    return await searchMoviesRepo.getSearchMovies(query);
  }

}