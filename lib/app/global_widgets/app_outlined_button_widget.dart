
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';
import 'app_text_widget.dart';

class AppOutlinedButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  final String? text;
  final Color? textColor;
  final TextStyle? labelStyle;
  final void Function()? onPressed;
  final double? radius;

  const AppOutlinedButtonWidget({
    Key? key,
    this.iconData,
    this.iconColor = AppColors.purple01,
    this.iconSize = AppDimensions.iconSize36,
    this.text,
    this.textColor = AppColors.gray03,
    this.labelStyle,
    required this.onPressed,
    this.radius = AppDimensions.radius30,
  })  : assert(iconData != null || text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? AppDimensions.zero,
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          // Icon
          if (iconData != null)
            AppIconWidget(
              iconData: iconData,
              size: iconSize,
              color: iconColor,
            ),

          // Space
          if (iconData != null && text != null)
            const SizedBox(
              width: AppDimensions.paddingOrMargin04,
            ),

          // Text
          if (text != null)
            AppTextWidget(
              text: text ?? '',
            ),
        ],
      ),
    );
  }
}
