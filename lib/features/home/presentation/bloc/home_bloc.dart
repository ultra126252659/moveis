import 'package:bloc/bloc.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_event.dart';
import 'package:moves_final_project/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()){
    on<ChangeSelectedBottomNavBar>((event, emit) {
      emit(HomeState(currentIndex: event.index));
    });

  }
 }