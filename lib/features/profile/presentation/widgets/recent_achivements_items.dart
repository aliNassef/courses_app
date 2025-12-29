import 'package:flutter/material.dart';

import 'recent_achivement_item.dart';

class RecentAchivementsItems extends StatelessWidget {
  const RecentAchivementsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      direction: Axis.horizontal,
      children: [
        RecentAchivementItem(),
        RecentAchivementItem(),
      ],
    );
  }
}
