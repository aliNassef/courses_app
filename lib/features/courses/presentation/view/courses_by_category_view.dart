import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:courses_app/core/extensions/mediaquery_size.dart';
import 'package:courses_app/core/navigation/app_navigation.dart';
import 'package:courses_app/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/courses_by_category_view_body.dart';

class CoursesByCategoryView extends StatelessWidget {
  const CoursesByCategoryView({super.key});
  static const String routeName = 'courses_by_category_view';
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: _buildCourseByCategoryAppBar(context),
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          color: AppColors.white,
          child: const CoursesByCategoryViewBody(),
        ),
      ),
    );
  }

  AdaptiveAppBar _buildCourseByCategoryAppBar(BuildContext context) {
    return AdaptiveAppBar(
      appBar: AppBar(
        title: Text(
          'Courses By Category',
          style: context.appTheme.bold16.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      cupertinoNavigationBar: CupertinoNavigationBar(
        middle: Text(
          'Courses By Category',
          style: context.appTheme.bold16.copyWith(
            color: AppColors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        trailing: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.black,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
