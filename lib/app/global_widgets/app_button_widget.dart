import '../core/values/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';
import 'app_text_widget.dart';

class AppButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final String? label;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final void Function()? onPressed;

  const AppButtonWidget({
    Key? key,
    this.iconData,
    this.iconColor = AppColors.gray03,
    this.label,
    this.labelColor = AppColors.gray03,
    this.labelStyle,
    required this.onPressed,
  })  : assert(iconData != null || label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: AppIconWidget(
        iconData: iconData,
        color: iconColor,
        size: AppDimensions.iconSize20,
      ),
      label: AppTextWidget(
        text: label ?? AppConstants.emptyString,
        style: labelStyle ?? TextStyle(
          color: labelColor,
        ),
      ),
    );
  }
}
