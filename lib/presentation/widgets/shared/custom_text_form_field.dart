import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Color primaryColor;
  final String? hintText;
  final Color hintColor;
  final Icon? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final String? errorMessage;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.primaryColor = Colors.black,
    this.hintText,
    this.hintColor = Colors.grey,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.errorMessage,
    this.onChanged,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final primaryBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: TextInputType.multiline,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          errorText: errorMessage,
          errorMaxLines: 2,
          labelText: labelText,
          labelStyle: TextStyle(
            color: primaryColor,
          ),
          errorBorder: primaryBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: primaryBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: primaryBorder,
          focusedBorder: primaryBorder,
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          prefixIcon: prefixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
