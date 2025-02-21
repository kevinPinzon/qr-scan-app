import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  final bool blurScreen;

  const CustomLoadingWidget({
    super.key,
    this.blurScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(
              blurScreen ? 0.4 : 0.0,
            ),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
