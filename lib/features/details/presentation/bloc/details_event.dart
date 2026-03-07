abstract class DetailsEvent {}

class GetDetailsEvent extends DetailsEvent{
  final int id;
  GetDetailsEvent(this.id);
}

class GetSuggestionsEvent extends DetailsEvent{
  final int id;
  GetSuggestionsEvent(this.id);
}