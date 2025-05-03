import 'package:flutter/material.dart';
import 'widgets/views/news_feed_app_bar_view.dart';
import 'widgets/views/news_feed_create_post_view.dart';
import 'widgets/views/news_feed_posts_view.dart';
import 'widgets/views/news_feed_rooms_view.dart';
import 'widgets/views/news_feed_stories_view.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar
          NewsFeedAppBarView(),

          // Create post
          NewsFeedCreatePostView(),

          // Rooms
          NewsFeedRoomsView(),

          // Stories
          NewsFeedStoriesView(),

          // Posts
          NewsFeedPostsView(),
        ],
      ),
    );
  }
}
