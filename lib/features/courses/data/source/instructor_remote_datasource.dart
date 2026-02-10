import '../../../../core/services/database/database.dart';
import '../models/instructor_model.dart';

abstract class InstructorRemoteDatasource {
  Future<InstructorModel> getInstructorInfo(String instructorId);
}

class InstructorRemoteDatasourceImpl implements InstructorRemoteDatasource {
  final Database database;

  InstructorRemoteDatasourceImpl({required this.database});
  @override
  Future<InstructorModel> getInstructorInfo(String instructorId) async {
    final instructor = await database.getInstructor(instructorId);
    return InstructorModel.fromMap(instructor.data() as Map<String, dynamic>);
  }
}
