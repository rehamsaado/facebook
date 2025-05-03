import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import '../core/values/constants/app_constants.dart';

class AppTabBarWidget extends StatelessWidget {
  final List<AppTabBarItem> items;
  final int selectedIndex;
  final void Function(int index) onTap;
  final bool isBottomIndicator;

  const AppTabBarWidget({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  }) : assert(
          items.length >= 2 && items.length <= 5,
          'items.length must be between 2 and 5',
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height60,
      child: Row(
        children: [
          ...items
              .asMap()
              .map(
                (int index, AppTabBarItem item) {
                  return MapEntry(
                    index, // Important
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: index != selectedIndex
                                ? null
                                : BorderDirectional(
                                    top: !isBottomIndicator
                                        ? const BorderSide(
                                            color: AppColors.primary,
                                            width: AppDimensions.thickness02,
                                          )
                                        : BorderSide.none,
                                    bottom: isBottomIndicator
                                        ? const BorderSide(
                                            color: AppColors.primary,
                                            width: AppDimensions.thickness02,
                                          )
                                        : BorderSide.none,
                                  ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon
                              if (item.iconData != null)
                                Icon(
                                  item.iconData,
                                  color: index == selectedIndex ? AppColors.primary : AppColors.gray02,
                                  size: AppDimensions.iconSize24,
                                ),

                              // Text
                              if (item.text != null)
                                Text(
                                  item.text ?? AppConstants.emptyString,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: AppDimensions.fontSize12,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
              .values
              .toList(),
        ],
      ),
    );
  }
}

class AppTabBarItem {
  final IconData? iconData;
  final String? text;

  const AppTabBarItem({
    this.iconData,
    this.text,
  }) : assert(iconData != null || text != null);
}
