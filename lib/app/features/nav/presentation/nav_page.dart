
import 'package:flutter/material.dart';

import '../../../global_widgets/app_tab_bar_widget.dart';
import '../../news_feed/presentation/news_feed_page.dart';
import '../../notifications/presentation/notifications_page.dart';
import '../../videos/presentation/videos_page.dart';

class NavPage extends StatefulWidget {
  var selectedIndex = 0;

  final items = [
    const AppTabBarItem(
      iconData: Icons.home,
      text: 'Home',
    ),
    const AppTabBarItem(
      iconData: Icons.video_call,
      text: 'Videos',
    ),
    const AppTabBarItem(
      iconData: Icons.notifications,
      text: 'Notifications',
    ),
  ];

  final pages = [
    const NewsFeedPage(),
    const VideosPage(),
    const NotificationsPage(),
  ];

  NavPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[widget.selectedIndex],
      bottomNavigationBar: AppTabBarWidget(
        items: widget.items,
        selectedIndex: widget.selectedIndex,
        onTap: (int index) {
          setState(
            () {
              widget.selectedIndex = index;
            },
          );
        },
        isBottomIndicator: false,
      ),
    );
  }
}
