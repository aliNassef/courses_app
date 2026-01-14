import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
