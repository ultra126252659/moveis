abstract class HomeEvent {}

class ChangeSelectedBottomNavBar extends HomeEvent{
  int index;
  ChangeSelectedBottomNavBar(this.index);
}

