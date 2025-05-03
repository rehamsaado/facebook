
import 'package:flutter/material.dart';

import '../../../../../../extra/fake_date.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_dimensions.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../global_widgets/app_avatar_widget.dart';
import '../../../../../global_widgets/app_button_widget.dart';

class NewsFeedCreatePostView extends StatelessWidget {
  const NewsFeedCreatePostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: AppDimensions.paddingOrMargin12,
          top: AppDimensions.paddingOrMargin08,
          end: AppDimensions.paddingOrMargin12,
          bottom: AppDimensions.zero,
        ),
        color: AppColors.white01,
        child: Column(
          children: [
            // What's in your mind
            Row(
              children: [
                // Avatar
                AppAvatarWidget(
                  imageUrl: FakeData.currentUser.imageUrl ?? '',
                ),

                // Space
                const SizedBox(
                  width: AppDimensions.paddingOrMargin08,
                ),

                // Text field
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: AppStrings.whatsInYourMind,
                    ),
                  ),
                )
              ],
            ),

            // Divider
            const Divider(
              height: AppDimensions.height10,
              thickness: AppDimensions.thickness_5,
            ),

            // Buttons
            SizedBox(
              height: AppDimensions.height40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Live
                  AppButtonWidget(
                    onPressed: () {},
                    iconData: Icons.videocam,
                    iconColor: AppColors.red01,
                    label: AppStrings.live,
                    labelStyle: const TextStyle(
                      color: AppColors.red01,
                    ),
                  ),

                  // Divider
                  const VerticalDivider(
                    width: AppDimensions.thickness08,
                  ),

                  // Photo
                  AppButtonWidget(
                    onPressed: () {},
                    iconData: Icons.photo_library,
                    iconColor: AppColors.green01,
                    label: AppStrings.photo,
                    labelStyle: const TextStyle(
                      color: AppColors.green01,
                    ),
                  ),

                  // Divider
                  const VerticalDivider(
                    width: AppDimensions.thickness08,
                  ),

                  // Room
                  AppButtonWidget(
                    onPressed: () {},
                    iconData: Icons.video_call,
                    iconColor: AppColors.purple01,
                    label: AppStrings.room,
                    labelStyle: const TextStyle(
                      color: AppColors.purple01,
                    ),
                  ),
                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
