import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:books/data/book_api.dart';
import 'package:books/domain/models/book_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<FetchBooks>(fetchbooks);
    on<Search>(searchbooks);
    on<UpdateBook>(updatebook);
  }
  final book = Books();

  //fetch all books
  FutureOr<void> fetchbooks(FetchBooks event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final result = await book.getbooks();

      result.fold((error) {
        emit(HomeError(messge: error));
      }, (booklist) {
        emit(HomeLoaded(booklist: booklist));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //search books
  FutureOr<void> searchbooks(Search event, Emitter<HomeState> emit) {
    List<BookModel> filterdbooks = [];
    emit(HomeLoading());
    filterdbooks = event.book
        .where((item) =>
            item.title.toLowerCase().contains(event.value.toLowerCase()))
        .toList();
    emit(HomeLoaded(booklist: filterdbooks));
  }

  //updatebook
  FutureOr<void> updatebook(UpdateBook event, Emitter<HomeState> emit) async {
    final newbook = BookModel(
        id: event.id,
        title: event.title,
        description: event.description,
        publishedDate: event.date,
        authorid: event.authorId,
        coverUrl: event.coverPictureURL,
        price: event.price);
    try {
      await book.updatebook(newbook);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
