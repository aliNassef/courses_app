import '../../../../core/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/di.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../courses/presentation/view/courses_by_category_view.dart';
import '../../data/models/category_model.dart';
import '../../data/models/category_nav_args.dart';
import 'category_card_item.dart';

class CategoryGridBlocBuilder extends StatelessWidget {
  const CategoryGridBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategorySuccess ||
          current is CategoryError ||
          current is CategoryLoading,

      builder: (context, state) {
        if (state is CategoryError) {
          return CustomFailureWidget(meesage: state.failure.errMessage);
        }

        if (state is CategoryLoading) {
          return SliverSkeletonizer(
            enabled: true,
            child: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CategoryCardItem(
                    category: CategoryModel(
                      createdAt: DateTime.now(),
                      id: "",
                      name: "",
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8-GVMiL1m8kmsRR2BD6NOtFr-aZvm3IVXjA&s',
                    ),
                  );
                },
                childCount: 6,
              ),
            ),
          );
        }
        if (state is CategorySuccess) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    _goToCoursesByCategory(context, state, index);
                  },
                  child: CategoryCardItem(
                    category: state.categories[index],
                  ),
                );
              },
              childCount: state.categories.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _goToCoursesByCategory(
    BuildContext context,
    CategorySuccess state,
    int index,
  ) {
    context.pushNamed(
      CoursesByCategoryView.routeName,
      arguments: NavArgs(
        animation: NavAnimation.fade,
        data: CategoryNavArgs(
          categoryId: state.categories[index].id,
          categoryName: state.categories[index].name,
        ),
      ),
    );
  }
}
