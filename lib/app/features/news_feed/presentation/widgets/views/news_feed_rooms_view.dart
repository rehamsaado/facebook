
import 'package:flutter/material.dart';

import '../../../../../../extra/fake_date.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_dimensions.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../global_widgets/app_avatar_widget.dart';
import '../../../../../global_widgets/app_outlined_button_widget.dart';

class NewsFeedRoomsView extends StatelessWidget {
  const NewsFeedRoomsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.only(
        start: AppDimensions.zero,
        top: AppDimensions.paddingOrMargin10,
        end: AppDimensions.zero,
        bottom: AppDimensions.zero,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: AppDimensions.height60,
          color: AppColors.white01,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingOrMargin10,
              horizontal: AppDimensions.paddingOrMargin08,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: FakeData.users.length + 1,
            itemBuilder: (BuildContext context, int index) {
              //Create room
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingOrMargin04,
                  ),
                  child: AppOutlinedButtonWidget(
                    onPressed: () {},
                    iconData: Icons.video_call,
                    text: AppStrings.room,
                  ),
                );
              }

              // Cause zero reserved for button, and
              // users in list view starts from 1
              // so index => index - 1
              final user = FakeData.users[index - 1];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin04,
                ),
                child: AppAvatarWidget(
                  imageUrl: user.imageUrl ?? '',
                  isStatusShown: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
