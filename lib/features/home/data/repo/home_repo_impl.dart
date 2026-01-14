import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';

import '../models/category_model.dart';

import 'package:dartz/dartz.dart';

import '../source/home_remote_datasource.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await remoteDatasource.getCategories();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
