

import '../../../users/domain/entities/user.dart';

class Post {
  final String caption;
  final String timeAgo;
  final String? imageUrl;
  final int likes;
  final int comments;
  final int shares;

  final User user;

  Post({
    required this.caption,
    required this.timeAgo,
    this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.user,
  });
}
