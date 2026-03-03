import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/core/errors/server_exception.dart';
import 'package:courses_app/core/models/search_model.dart';
import 'package:courses_app/core/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl extends SearchRepo {
  final Database _database;

  SearchRepoImpl({required Database database}) : _database = database;
  @override
  Future<Either<Failure, List<SearchModel>>> searchOnQuery(
    String query,
    String userId,
  ) async {
    try {
      final searchResult = await _database.searchOnCourses(query, userId);
      return right(searchResult);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.message));
    }
  }
}
