
import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_dimensions.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../global_widgets/app_avatar_widget.dart';
import '../../../../global_widgets/app_circle_button_widget.dart';
import '../../../../global_widgets/app_image_widget.dart';
import '../../../../global_widgets/app_text_widget.dart';
import '../../../users/domain/entities/user.dart';
import '../../domain/entities/story.dart';

class StoryWidget extends StatelessWidget {
  final User? currentUser; // For creating story
  final Story? story; // For real story
  final bool isAddStory;

  const StoryWidget({
    Key? key,
    this.currentUser,
    this.story,
    this.isAddStory = false,
  })  : assert(
          isAddStory && currentUser != null || !isAddStory && story != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Clipped image
        ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius12,
          ),
          child: AppImageWidget(
            path: isAddStory ? currentUser?.imageUrl ?? '' : story?.imageUrl ?? '',
            width: AppDimensions.width110,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // Overlay
        Container(
          width: AppDimensions.width110,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColors.linearGradient02,
            borderRadius: BorderRadius.circular(
              AppDimensions.radius12,
            ),
          ),
        ),

        // Add Story Button or User
        PositionedDirectional(
          top: AppDimensions.paddingOrMargin08,
          start: AppDimensions.paddingOrMargin08,
          child: isAddStory
              ? AppCircleButtonWidget(
                  iconData: Icons.add,
                  onPressed: () {},
                  iconColor: AppColors.primary,
                  iconSize: AppDimensions.iconSize24,
                  backgroundColor: AppColors.white01,
                  backgroundSize: AppDimensions.iconSize40,
                  margin: AppDimensions.zero,
                )
              : AppAvatarWidget(
                  imageUrl: story?.user.imageUrl ?? '',
                  isBordered: story?.isViewed == false,
                ),
        ),

        // Text
        PositionedDirectional(
          start: AppDimensions.paddingOrMargin08,
          end: AppDimensions.paddingOrMargin08,
          bottom: AppDimensions.paddingOrMargin08,
          child: AppTextWidget(
            text: isAddStory ? AppStrings.addToStory : story?.user?.name ?? '',
            style: const TextStyle(
              color: AppColors.white01,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
