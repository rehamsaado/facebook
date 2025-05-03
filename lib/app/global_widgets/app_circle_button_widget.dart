import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';


class AppCircleButtonWidget extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final void Function() onPressed;
  final Color backgroundColor;
  final double? backgroundSize;
  final Color iconColor;
  final double margin;

  const AppCircleButtonWidget({
    Key? key,
    required this.iconData,
    this.iconSize = AppDimensions.iconSize30,
    required this.onPressed,
    this.backgroundColor = AppColors.gray01,
    this.iconColor = AppColors.black01,
    this.backgroundSize,
    this.margin = AppDimensions.paddingOrMargin06,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backgroundSize,
      height: backgroundSize,
      margin: EdgeInsetsDirectional.all(
        margin,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Center(
          child: Icon(
            iconData,
            size: iconSize,
          ),
        ),
        iconSize: iconSize,
        color: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}
