import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';

class CustBottomNav extends StatelessWidget with Application {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: color.peach,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: Container(
                    height: 7,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: isSelected
                        ? BoxDecoration(
                            color: color.primary,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          )
                        : null,
                  ),
                );
              }),
            ),
          ),
          // Container for the images
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onTap(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: isSelected ? 1.0 : 0.6,
                          child: Image.asset(
                            isSelected
                                ? _getFillImage(index)
                                : _getOutlineImage(index),
                            height: _getImageSize(index),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          ['Records', 'Analysis', 'Account', 'Category'][index],
                          style: CustomText(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: isSelected
                                ? color.primaryDark
                                : color.primaryDark.withOpacity(0.5),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String _getOutlineImage(int index) {
    return [
      icon.RECORD_LINE,
      icon.ANALYSIS_LINE,
      icon.ACCOUNTS_LINE,
      icon.CATEGORY_LINE
    ][index];
  }

  String _getFillImage(int index) {
    return [
      icon.RECORD_FILL,
      icon.ANALYSIS_FILL,
      icon.ACCOUNTS_FILL,
      icon.CATEGORY_FILL
    ][index];
  }

  double _getImageSize(int index) {
    return [30.0, 30.0, 30.0, 30.0][index];
  }
}
