import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/details/domain/repo/details_repo.dart';
import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

@injectable
class DetailsUseCase {
  DetailsRepo detailsRepo;
  DetailsUseCase(this.detailsRepo);
 Future<MoviesResponse> call(int id) async {
    return await detailsRepo.getDetailsMovies(id);
  }
}
