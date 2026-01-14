import 'package:bloc/bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._homeRepo) : super(CategoryInitial());
  final HomeRepo _homeRepo;

  void getCategories() async {
    emit(CategoryLoading());
    final categoriesOrfailure = await _homeRepo.getCategories();
    categoriesOrfailure.fold(
      (failure) => emit(CategoryError(failure: failure)),
      (categories) => emit(CategorySuccess(categories: categories)),
    );
  }
}
