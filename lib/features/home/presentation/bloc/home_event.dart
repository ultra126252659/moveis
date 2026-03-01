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

class ChangeBackgroundEvent extends HomeEvent {
  final String imageUrl;
  ChangeBackgroundEvent(this.imageUrl);
}