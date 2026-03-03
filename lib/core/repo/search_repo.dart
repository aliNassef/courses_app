import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/core/models/search_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> searchOnQuery(
    String query,
    String userId,
  );
}
