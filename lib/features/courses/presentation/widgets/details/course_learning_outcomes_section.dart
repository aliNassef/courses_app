import '../../../../../core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/translations/locale_keys.g.dart';

class CourseLearningOutcomesSection extends StatelessWidget {
  const CourseLearningOutcomesSection({
    super.key,
    required this.learningOutcomes,
  });
  final List<String> learningOutcomes;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: const BoxDecoration(
        color: Color(0xfff3f8fe),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.what_you_will_learn.tr(),
            style: context.appTheme.bold16,
          ),
          const Gap(16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: learningOutcomes.length,
            separatorBuilder: (context, index) {
              return const Gap(16);
            },
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 14.r,
                    ),
                  ),
                  const Gap(8),
                  Flexible(
                    child: Text(
                      learningOutcomes[index],
                      style: context.appTheme.medium12.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
