import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/instructor_model.dart';
import '../../../data/repo/instructor/instructor_repo.dart';

part 'instructor_state.dart';

class InstructorCubit extends Cubit<InstructorState> {
  InstructorCubit(this.repo) : super(InstructorInitial());
  final InstructorRepo repo;

  void getInstructorInfo(String instructorId) async {
    emit(InstructorLoading());
    final instructorOrfailure = await repo.getInstructorInfo(instructorId);
    instructorOrfailure.fold(
      (failure) => emit(InstructorError(failure: failure)),
      (instructor) => emit(InstructorLoaded(instructor: instructor)),
    );
  }
}
