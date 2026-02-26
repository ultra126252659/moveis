enum RequestStatus{
  init,
  loading,
  success,
  error,
}

class HomeState {
  int currentIndex;
  HomeState({this.currentIndex = 0});
}