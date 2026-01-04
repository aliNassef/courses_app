import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/presentation/view_model/instructor_cubit/instructor_cubit.dart';

class InstructorName extends StatelessWidget {
  const InstructorName({
    super.key,
    required this.instructorId,
  });
  final String instructorId;
  @override
  Widget build(BuildContext context) {
    AppLogger.info(instructorId);
    return BlocProvider(
      create: (context) =>
          injector<InstructorCubit>()..getInstructorInfo(instructorId),
      child: Builder(
        builder: (context) {
          final state = context.watch<InstructorCubit>().state;

          if (state is InstructorLoading) {
            return Skeletonizer(
              enabled: true,
              child: Text(
                'Ali Nassef',
                style: context.appTheme.regular12.copyWith(
                  color: AppColors.grey,
                ),
              ),
            );
          }
          if (state is InstructorLoaded) {
            return Text(
              "By ${state.instructor.name}",
              style: context.appTheme.regular12.copyWith(
                color: AppColors.grey,
              ),
            );
          }
          if (state is InstructorError) {
            return Text(
              state.failure.errMessage,
              style: context.appTheme.regular12.copyWith(
                color: AppColors.grey,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
