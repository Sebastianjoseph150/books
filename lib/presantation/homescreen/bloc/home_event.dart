part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchBooks extends HomeEvent{}

class Search extends HomeEvent{
  final String value;
  final List<BookModel> book;

  Search({
    required this.value,
    required this.book,
  });
}

class UpdateBook extends HomeEvent{
  final String id;
  final String title;
  final String description;
  final String date;
  final String coverPictureURL;
  final String authorId;
  final int price;

  UpdateBook({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.coverPictureURL,
    required this.authorId,
    required this.price
  });
}
