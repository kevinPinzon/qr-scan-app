import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/theme.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    required this.inputFieldTitle,
    this.isPassword,
    this.onChanged,
    this.isRequired = true,
    this.controller,
    this.icon,
    this.keyboardType,
    this.initialValue,
    this.textInputAction,
    this.onTap,
    this.suffixIcon,
    this.focusNode,
    this.inputFormatters,
    this.validator,
  });

  final String hintText;
  final String inputFieldTitle;
  final bool isRequired;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputTitle(context, inputFieldTitle),
          const SizedBox(
            height: 0.5,
          ),
          _textFormField(context),
        ],
      ),
    );
  }

  TextFormField _textFormField(BuildContext context) {
    return TextFormField(
        onTap: onTap,
        autofocus: false,
        controller: controller,
        focusNode: focusNode,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
        obscureText: isPassword ?? false,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        decoration: _inputDecoration(context),
        keyboardType: keyboardType,
        readOnly: true);
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      border: const OutlineInputBorder(),
      enabledBorder: inputDecorationTheme.enabledBorder,
      suffixIcon: suffixIcon,
    );
  }

  RichText _inputTitle(BuildContext context, String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: isRequired
                  ? Theme.of(context).colorScheme.error
                  : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
