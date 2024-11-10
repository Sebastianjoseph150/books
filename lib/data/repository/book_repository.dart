/*
Books Repository

Defines how books are manged
*/
import 'package:books/domain/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BooksRepo {
//Get books with pagination
  Future<Either<String, List<BookModel>>> getbooks();

//get book by id
  Future<BookModel> getbookbyid(String id);

//Update book by id
  Future<void> updatebook(BookModel book);

//Delete book by id
  Future<BookModel> deletebook(String id);
}
