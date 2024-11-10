/*
Author Repository

Defines how Authors are manged
*/
import 'package:books/domain/models/author_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorRepo {
  //Create an author
  Future<Either<String, List<AuthorModel>>> createauthor(AuthorModel author);

  //Get all authors
  Future<Either<String, List<AuthorModel>>> getauthors();
}
