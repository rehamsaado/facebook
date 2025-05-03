


import '../../../users/domain/entities/user.dart';

class Story {
  final String imageUrl;
  final bool isViewed;

  final User user;

  Story({
    required this.imageUrl,
    this.isViewed = false,
    required this.user,
  });
}
