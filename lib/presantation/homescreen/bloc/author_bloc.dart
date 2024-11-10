import 'dart:async';
import 'dart:math';

import 'package:books/data/repository/auth_api.dart';
import 'package:books/domain/models/author_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  AuthorBloc() : super(AuthorInitial()) {
    on<AuthorEvent>((event, emit) {});
    on<FetchAuhtors>(fetchauthors);
    on<Addauthor>(addauthor);
  }
  final author = Author();

  //fetch all authors
  FutureOr<void> fetchauthors(
      FetchAuhtors event, Emitter<AuthorState> emit) async {
    emit(AuthorLoading());
    try {
      final result = await author.getauthors();
      result.fold((errormessage) {
        emit(AuthorError(messge: errormessage));
      }, (author) {
        emit(AuthorLoaded(authorlist: author));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //add a new author
  FutureOr<void> addauthor(Addauthor event, Emitter<AuthorState> emit) async {
    emit(AuthorLoading());
    final random = Random();
    String randomId = List.generate(12,
            (index) => random.nextInt(256).toRadixString(16).padLeft(2, '0'))
        .join();

    try {
      final AuthorModel newauthor = AuthorModel(
          id: randomId,
          name: event.name,
          biography: event.biography,
          birthDate: event.dob);
      final result = await author.createauthor(newauthor);

      result.fold((error) {
        emit(AuthorError(messge: error));
      }, (author) {
        emit(AuthorLoaded(authorlist: author));
      });
    } catch (e) {
      emit(AuthorError(messge: e.toString()));
    }
  }
}
