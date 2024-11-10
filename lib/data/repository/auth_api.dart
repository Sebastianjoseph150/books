import 'dart:convert';

import 'package:books/data/repository/author_repository.dart';
import 'package:books/domain/models/author_model.dart';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Author implements AuthorRepo {
  List<AuthorModel> auhtorlist = [];
  @override
  Future<Either<String, List<AuthorModel>>> getauthors() async {
    //fetching the authors
    final url = Uri.parse('https://assessment.eltglobal.in/api' + '/authors');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonresponse = jsonDecode(response.body);

        List<dynamic> result = jsonresponse['result'];

        auhtorlist =
            result.map((element) => AuthorModel.fromjson(element)).toList();

        //if success return the list of instances of authormodel
        return right(auhtorlist);
      } else {
        return left('failed to fetch authors');
      }
    } catch (e) {
      //if failure return the error string
      return left(e.toString());
    }
  }

  //Method to create an Author
  @override
  Future<Either<String, List<AuthorModel>>> createauthor(
      AuthorModel author) async {
    //url
    final url = Uri.parse('https://assessment.eltglobal.in/api' + '/authors');
    try {
      final response = await http.post(url, body: {
        "name": author.name,
        "biography": author.biography,
        "birthdate": author.birthDate
      });

      //if success
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonresponse = jsonDecode(response.body);
        Map<String, dynamic> result = jsonresponse['result'];

        //change the result to author model
        final newauthor = AuthorModel.fromjson(result);

        //add to the list
        auhtorlist.insert(0, newauthor);

        return right(auhtorlist);
      } else {
        return left('Something went wrong');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
