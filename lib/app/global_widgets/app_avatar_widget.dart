
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_image_widget.dart';

class AppAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isStatusShown;
  final bool isBordered;
  final Color statusColor;
  final Color borderColor;
  final double radius;
  final double borderThickness;

  const AppAvatarWidget({
    Key? key,
    required this.imageUrl,
    this.isStatusShown = false,
    this.isBordered = false,
    this.statusColor = AppColors.green01,
    this.borderColor = AppColors.primary,
    this.radius = AppDimensions.radius20,
    this.borderThickness = 2.0,
  })  : assert(
          radius >= borderThickness,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background & Image
        CircleAvatar(
          radius: radius,
          backgroundColor: borderColor,
          child: CircleAvatar(
            radius: isBordered ? radius - borderThickness : radius,
            backgroundColor: AppColors.gray01,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                radius,
              ),
              child: AppImageWidget(
                path: imageUrl,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Status
        if (isStatusShown)
          PositionedDirectional(
            bottom: AppDimensions.zero,
            end: AppDimensions.zero,
            child: Container(
              width: AppDimensions.width15,
              height: AppDimensions.height15,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: AppDimensions.thickness02,
                  color: AppColors.white01,
                ),
              ),
            ),
          )
      ],
    );
  }
}
