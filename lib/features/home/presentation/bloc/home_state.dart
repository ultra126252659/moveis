import 'package:moves_final_project/features/home/data/model/MoviseResponse.dart';

enum RequestStatus{
  init,
  loading,
  success,
  error, idle,
}

class HomeState {
  RequestStatus? getMoviesStatus;
  MoviesResponse? moviesResponse;
  String? errorMassage;
  int? currentIndex;
  String? currentBackground;
  String? selectedCategory;
  bool? isSearching;
  String? searchQuery;
  List<String> genres;
  List<Movies> allMovies;
  List<Movies> filteredMovies;
  HomeState({
    this.getMoviesStatus = RequestStatus.init,
    this.selectedCategory = 'All',
    this.moviesResponse,
    this.errorMassage,
    this.currentBackground,
    this.isSearching = false,
    this.searchQuery = '',
    this.genres = const [],
    this.allMovies = const [],
    this.filteredMovies = const [],
    this.currentIndex = 0});

  HomeState copyWith({
    RequestStatus? getMoviesStatus,
    MoviesResponse? moviesResponse,
    String? errorMassage,
    String? selectedCategory,
    bool? isSearching,
    String? searchQuery,
    List<String>? genres,
    List<Movies>? allMovies,
    List<Movies>? filteredMovies,
    String? currentBackground,}){
    return HomeState(
      getMoviesStatus: getMoviesStatus ?? this.getMoviesStatus,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentBackground: currentBackground ?? this.currentBackground,
      isSearching: isSearching ?? this.isSearching,
      searchQuery: searchQuery ?? this.searchQuery,
      genres: genres ?? this.genres,
      allMovies: allMovies ?? this.allMovies,
      filteredMovies: filteredMovies ?? this.filteredMovies,


    );
  }
}