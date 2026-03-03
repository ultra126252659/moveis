abstract class HomeEvent {}

class ChangeSelectedBottomNavBar extends HomeEvent{
  int index;
  ChangeSelectedBottomNavBar(this.index);
}

class GetMovies extends HomeEvent{
  GetMovies();
}
class GetNewMovies extends HomeEvent{

  GetNewMovies();
}
class SelectCategoryEvent extends HomeEvent {
  final String categoryName;

   SelectCategoryEvent({required this.categoryName});
}
class GetSearchMoviesEvent extends HomeEvent {
  final String query;
  GetSearchMoviesEvent(this.query);
}
class ChangeBackgroundEvent extends HomeEvent {
  final String imageUrl;
  ChangeBackgroundEvent(this.imageUrl);
}