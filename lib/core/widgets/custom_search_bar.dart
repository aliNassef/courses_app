import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/controller/bloc/search_on_courses_bloc.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/di/service_locator.dart';
import 'package:courses_app/core/widgets/custom_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../translations/locale_keys.g.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().userId;
    return BlocProvider(
      create: (context) => injector<SearchOnCoursesBloc>(),
      child: Builder(
        builder: (innerContext) {
          return Material(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                AdaptiveTextField(
                  textInputAction: TextInputAction.search,
                  onChanged: (query) {
                    innerContext.read<SearchOnCoursesBloc>().add(
                      SearchOnCoursesEvent(query: query, userId: userId),
                    );
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    filled: true,

                    hint: Text(
                      LocaleKeys.what_do_you_want_to_learn.tr(),
                      style: context.typography.medium14.copyWith(
                        color: AppColors.black.withValues(alpha: 0.49),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(
                      Icons.tune,
                      color: AppColors.primary,
                    ),
                    prefixIconColor: AppColors.black.withValues(alpha: 0.56),
                    fillColor: AppColors.white,
                    border: _buildOutLineBorder(),
                    enabledBorder: _buildOutLineBorder(),
                    focusedBorder: _buildOutLineBorder(),
                  ),
                ),
                BlocBuilder<SearchOnCoursesBloc, SearchOnCoursesState>(
                  builder: (context, state) {
                    return switch (state) {
                      SearchOnCoursesInitial() => const SizedBox.shrink(),
                      SearchOnCoursesLoading() => const LinearProgressIndicator(
                        color: AppColors.primary,
                      ),
                      SearchOnCoursesSuccess(:var courses) =>
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            final data = courses[index].course;
                            final isSubscribed = courses[index].isSubscribed;
                            return AdaptiveListTile(
                              backgroundColor: AppColors.white,
                              leading: CustomNetworkImage(
                                img: data.imageUrl,
                                width: 40,
                                height: 40,
                                radius: 12,
                              ),
                              title: Text(data.title),
                              subtitle: Text(data.level.name),
                              trailing: isSubscribed
                                  ? SizedBox(
                                      width: 100,
                                      child: Chip(
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                        label: Text(
                                          'Subscribed',
                                          style: context.typography.regular12
                                              .copyWith(
                                                color: AppColors.primary,
                                              ),
                                        ),
                                        backgroundColor: Colors.greenAccent,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            );
                          },
                          separatorBuilder: (_, _) => const Gap(16),
                          itemCount: courses.length,
                        ),
                      SearchOnCoursesError(:final failure) =>
                        CustomFailureWidget(meesage: failure.errMessage),
                    };
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder _buildOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
