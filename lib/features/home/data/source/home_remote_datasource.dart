import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/features/home/data/models/category_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final Database _db;

  HomeRemoteDatasourceImpl({required Database db}) : _db = db;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final data = await _db.getCategories();
    return data
        .map((e) => CategoryModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }
}
