import 'package:flutter/material.dart';
import 'package:qr_scan_app/core/common/enums.dart';
import 'package:qr_scan_app/core/theme/colors.dart';
import 'package:qr_scan_app/core/theme/sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.style = CustomButtonStyle.yellow,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.height,
    this.leadingIcon,
  });

  final CustomButtonStyle style;
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? height;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: 300,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: _textColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: style == CustomButtonStyle.outline
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.transparent,
            ),
          ),
          backgroundColor: _backgroundColor(context),
        ),
        child: _body(context),
      ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    switch (style) {
      case CustomButtonStyle.yellow:
        return Theme.of(context).colorScheme.primary;
      case CustomButtonStyle.black:
        return Theme.of(context).colorScheme.secondary;
      case CustomButtonStyle.disabled:
        return AppColors.disabled;
      default:
        return Colors.white;
    }
  }

  Color _textColor(BuildContext context) {
    switch (style) {
      case CustomButtonStyle.black:
        return Theme.of(context).colorScheme.secondary;
      default:
        return Colors.white;
    }
  }

  Widget _body(BuildContext context) {
    if (leadingIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [leadingIcon!, const SizedBox(width: 10), _textBtn(context)],
      );
    } else {
      return _textBtn(context);
    }
  }

  Widget _textBtn(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? mediumTextSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
