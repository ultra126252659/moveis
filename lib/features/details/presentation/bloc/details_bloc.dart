import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:moves_final_project/features/details/domain/use_Case/details_use_case.dart';
import 'package:moves_final_project/features/details/domain/use_Case/suggestions_use_case.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_event.dart';
import 'package:moves_final_project/features/details/presentation/bloc/details_state.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';
@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsUseCase detailsUseCase;
  SuggestionsUseCase suggestionsUseCase;
  DetailsBloc(this.detailsUseCase, this.suggestionsUseCase) : super(DetailsState()) {
    on<GetDetailsEvent>((event, emit) async {
      emit(state.copyWith(getDetailsMovies: RequestStatus.loading));
      try {
        var response = await detailsUseCase(event.id);
        emit(state.copyWith(
          getDetailsMovies: RequestStatus.success,
          moviesResponse: response,
        ));} catch (e) {
        emit(state.copyWith(
          getDetailsMovies: RequestStatus.error,
          errorMassage: e.toString(),
        ));
      }
    });
    on<GetSuggestionsEvent>((event, emit) async {
      emit(state.copyWith(getSuggestionsMovies: RequestStatus.loading));
      try{
        var response = await suggestionsUseCase(event.id);
        emit(state.copyWith(
          getSuggestionsMovies: RequestStatus.success,
          moviesResponse: response,
        ));
      } catch (e) {
        emit(state.copyWith(
          getSuggestionsMovies: RequestStatus.error,
          errorMassage: e.toString(),
        ));}
    });
  }
}