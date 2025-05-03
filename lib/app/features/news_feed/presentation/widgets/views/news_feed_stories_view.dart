
import 'package:flutter/material.dart';

import '../../../../../../extra/fake_date.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_dimensions.dart';
import '../../../../stories/presentation/widgets/story_widget.dart';

class NewsFeedStoriesView extends StatelessWidget {
  const NewsFeedStoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.only(
        start: AppDimensions.zero,
        top: AppDimensions.paddingOrMargin10,
        end: AppDimensions.zero,
        bottom: AppDimensions.paddingOrMargin10,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: AppDimensions.height200,
          color: AppColors.white01,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingOrMargin08,
              horizontal: AppDimensions.paddingOrMargin08,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: FakeData.stories.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingOrMargin04,
                  ),
                  child: StoryWidget(
                    currentUser: FakeData.currentUser,
                    isAddStory: true,
                  ),
                );
              }

              final story = FakeData.stories[index - 1];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin04,
                ),
                child: StoryWidget(
                  story: story,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
