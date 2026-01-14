import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/logging/app_logger.dart';
import 'package:courses_app/core/navigation/app_navigation.dart';
import 'package:courses_app/core/utils/app_dilagos.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:courses_app/features/my_learning/data/model/my_learning_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../my_learning/data/model/my_learning_enum.dart';
import '../../../my_learning/data/model/my_learning_request_model.dart';
import '../../../my_learning/presentation/view_model/mylearning_cubit/my_leaning_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/translations/locale_keys.g.dart';
import '../../data/models/course_model.dart';

class CourseEnrollmentBar extends StatelessWidget {
  const CourseEnrollmentBar({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: context.width,
      color: AppColors.white,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$90.00',
                style: context.appTheme.medium12.copyWith(
                  color: AppColors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                '\$${course.price.toStringAsFixed(1)}',
                style: context.appTheme.bold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const Gap(16),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              border: Border.all(
                color: AppColors.grey,
              ),
            ),
            child: const Icon(
              CupertinoIcons.cart_fill,
              color: AppColors.black,
              size: 24,
            ),
          ),
          const Gap(16),
          BlocListener<MyLearningCubit, MyLearningState>(
            listenWhen: (previous, current) =>
                current is AddCourseToMyLearningFailure ||
                current is AddCourseToMyLearningLoading ||
                current is AddCourseToMyLearningSuccess,
            listener: (context, state) {
              if (state is AddCourseToMyLearningFailure) {
                context.pop();
                AppDilagos.showErrorMessage(
                  context,
                  errMessage: state.failure.errMessage,
                );
              }

              if (state is AddCourseToMyLearningLoading) {
                AppLogger.info("message");
                AppDilagos.showLoadingBox(context);
              }

              if (state is AddCourseToMyLearningSuccess) {
                context.pop();
                AppDilagos.showToast(
                  text: LocaleKeys.course_added_success.tr(),
                );
              }
            },
            child: AdaptiveButton.child(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
              minSize: Size(context.width * 0.45, 46.r),
              onPressed: () {
                _addCourseToMyLearning(context);
              },
              child: Text(
                LocaleKeys.enroll_now.tr(),
                style: context.appTheme.bold16.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addCourseToMyLearning(BuildContext context) {
    var mylearning = MyLearningModel(
      courseId: course.id,
      instructorId: course.instructorId,
      courseTitle: course.title,
      courseImage: course.imageUrl,
      progress: 0,
      completedLessons: 0,
      totalLessons: course.duration,
      status: MyLearningEnum.inProgress.value,
      enrolledAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    var myLearningRequestModel = MyLearningRequestModel(
      courseId: course.id,
      userId: context.read<AuthCubit>().userId,
      data: mylearning.toMap(),
    );
    context.read<MyLearningCubit>().addCourseToLearning(
      myLearningRequestModel,
    );
  }
}
