
import 'package:flutter/material.dart';

import '../../../../../../extra/fake_date.dart';
import '../../../../posts/presentation/widgets/post_widget.dart';

class NewsFeedPostsView extends StatelessWidget {
  const NewsFeedPostsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final post = FakeData.posts[index];

          return PostWidget(
            post: post,
          );
        },
        childCount: FakeData.posts.length,
      ),
    );
  }
}
