part of 'author_bloc.dart';

@immutable
sealed class AuthorEvent {}

class FetchAuhtors extends AuthorEvent{}

class Addauthor extends AuthorEvent{
  final String name;
  final String biography;
  final String dob;

  Addauthor({
    required this.name,
    required this.biography,
    required this.dob
  });
}
