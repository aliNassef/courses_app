import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../utils/utils.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late ValueNotifier<bool> controller;
  @override
  void initState() {
    super.initState();
    controller = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return AdvancedSwitch(
          activeColor: AppColors.primary,
          inactiveColor: const Color(0xffe2e8f0),
          onChanged: (value) {
            controller.value = value;
          },
        );
      },
    );
  }
}
