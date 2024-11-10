part of 'author_bloc.dart';

@immutable
sealed class AuthorState {}

final class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState{}

class AuthorLoaded extends AuthorState{
  final List<AuthorModel> authorlist;
  AuthorLoaded({
    required this.authorlist
  });
}

class AuthorError extends AuthorState{
  final String messge;
 AuthorError({
    required this.messge,
  });
}

