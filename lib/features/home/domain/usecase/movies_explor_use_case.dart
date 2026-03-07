import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/repo/move_repo.dart';

@injectable
class ExploreMoviesUseCase {
  MoviesRepo moviesRepo;
  ExploreMoviesUseCase(this.moviesRepo);

  Future<MoviesResponse> call(String genre) async {
    return await moviesRepo.getExploreMovies(genre);
  }
}