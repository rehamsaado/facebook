import '../core/values/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_text_widget.dart';

class AppIconWidget extends StatelessWidget {
  final IconData? iconData;
  final Color? color;
  final double? size;

  const AppIconWidget({
    Key? key,
    this.iconData,
    this.color = AppColors.gray03,
    this.size = AppDimensions.iconSize24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }
}
