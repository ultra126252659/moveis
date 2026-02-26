import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';
import 'package:moves_final_project/features/home/domain/repo/move_repo.dart';

@injectable
class MoviesUseCase {
  MoviesRepo moviesRepo;
  MoviesUseCase(this.moviesRepo);

  Future<MoviesResponse> call(String sortBy) async {
    return await moviesRepo.getMovies(sortBy);
  }
}