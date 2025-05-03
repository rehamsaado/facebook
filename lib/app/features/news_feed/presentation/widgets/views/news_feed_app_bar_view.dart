

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_dimensions.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../global_widgets/app_circle_button_widget.dart';
import '../../../../../global_widgets/app_text_widget.dart';

class NewsFeedAppBarView extends StatelessWidget {
  const NewsFeedAppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.white01,
      title: const AppTextWidget(
        text: AppStrings.facebook,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: AppDimensions.fontSize28,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      centerTitle: false,
      floating: false,
      pinned: false,
      actions: [
        // Search
        AppCircleButtonWidget(
          iconData: Icons.search,
          onPressed: () {},
        ),

        // Messenger
        AppCircleButtonWidget(
          iconData: MdiIcons.facebookMessenger,
          onPressed: () {},
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
