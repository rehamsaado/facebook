import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_dimensions.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../global_widgets/app_avatar_widget.dart';
import '../../../../global_widgets/app_button_widget.dart';
import '../../../../global_widgets/app_circle_button_widget.dart';
import '../../../../global_widgets/app_icon_widget.dart';
import '../../../../global_widgets/app_image_widget.dart';
import '../../../../global_widgets/app_text_widget.dart';
import '../../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingOrMargin04,
        horizontal: AppDimensions.zero,
      ),
      elevation: AppDimensions.zero,
      shape: null,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          top: AppDimensions.paddingOrMargin06,
        ),
        color: AppColors.white01,
        child: Column(
          children: [
            //region Header & Caption

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingOrMargin12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  _PostHeaderWidget(
                    post: post,
                  ),

                  // Space
                  const SizedBox(
                    height: AppDimensions.paddingOrMargin04,
                  ),

                  // Caption
                  AppTextWidget(
                    text: post.caption,
                  ),
                ],
              ),
            ),

            //endregion Header & Caption

            // Space
            const SizedBox(
              height: AppDimensions.paddingOrMargin04,
            ),

            //region Image

            if (post.imageUrl != null)
              AppImageWidget(
                path: post.imageUrl!,
              ),

            //endregion Image

            // Space
            const SizedBox(
              height: AppDimensions.paddingOrMargin04,
            ),

            //region Stats

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingOrMargin12,
              ),
              child: _PostStatsWidget(
                post: post,
              ),
            ),

            //endregion Stats

            // Space
            const SizedBox(
              height: AppDimensions.paddingOrMargin04,
            ),

            // Divider
            const Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingOrMargin12,
              ),
              child: Divider(
                thickness: AppDimensions.thickness01,
                height: AppDimensions.zero,
              ),
            ),

            //region Buttons

            const Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppDimensions.paddingOrMargin12,
              ),
              child: _PostButtonsWidget(),
            ),

            //endregion Buttons
          ],
        ),
      ),
    );
  }
}

class _PostHeaderWidget extends StatelessWidget {
  final Post post;

  const _PostHeaderWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar
        AppAvatarWidget(
          imageUrl: post.user.imageUrl ?? '',
        ),

        // Space
        const SizedBox(
          width: AppDimensions.paddingOrMargin08,
        ),

        // Username & Time Ago
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username
              AppTextWidget(
                text: post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Time Ago
              Row(
                children: [
                  // Text
                  AppTextWidget(
                    text: '${post.timeAgo} • ',
                    style: const TextStyle(
                      color: AppColors.gray02,
                      fontSize: AppDimensions.fontSize12,
                    ),
                  ),

                  // Icon
                  const AppIconWidget(
                    iconData: Icons.public,
                    color: AppColors.gray02,
                    size: AppDimensions.iconSize12,
                  )
                ],
              ),
            ],
          ),
        ),

        // Menu Icon
        AppCircleButtonWidget(
          iconData: Icons.more_horiz,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PostStatsWidget extends StatelessWidget {
  final Post post;

  const _PostStatsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const statTextStyle = TextStyle(
      color: AppColors.gray02,
      fontSize: AppDimensions.fontSize12,
    );

    return Row(
      children: [
        // Like Icon
        Container(
          padding: const EdgeInsetsDirectional.all(
            AppDimensions.paddingOrMargin04,
          ),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const AppIconWidget(
            iconData: Icons.thumb_up,
            size: AppDimensions.iconSize10,
            color: AppColors.white01,
          ),
        ),

        // Space
        const SizedBox(
          width: AppDimensions.paddingOrMargin04,
        ),

        // Likes
        AppTextWidget(
          text: '${post.likes}',
          style: statTextStyle,
        ),

        // Spacer
        const Spacer(),

        // Comments
        AppTextWidget(
          text: '${post.comments} ${AppStrings.comments}',
          style: statTextStyle,
        ),

        // Space
        const SizedBox(
          width: AppDimensions.paddingOrMargin08,
        ),

        // Shares
        AppTextWidget(
          text: '${post.shares} ${AppStrings.shares}',
          style: statTextStyle,
        )
      ],
    );
  }
}

class _PostButtonsWidget extends StatelessWidget {
  const _PostButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Like
        Expanded(
          child: AppButtonWidget(
            iconData: Icons.thumb_up,
            label: AppStrings.like,
            onPressed: () {},
          ),
        ),

        // Comment
        Expanded(
          child: AppButtonWidget(
            iconData: MdiIcons.commentOutline,
            label: AppStrings.comment,
            onPressed: () {},
          ),
        ),

        // share
        Expanded(
          child: AppButtonWidget(
            iconData: MdiIcons.shareOutline,
            label: AppStrings.share,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
