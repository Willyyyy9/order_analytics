import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class AppTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function(String)? onSubmited;
  final String? Function(String?)? validator;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final double fontSize;
  final void Function()? onSuffixPressed;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final Iterable<String>? autofillHints;

  const AppTextFormField(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator,
      this.keyboardType,
      this.onSubmited,
      this.suffixIcon,
      this.prefixIcon,
      this.fontSize = 12,
      this.inputFormatters,
      this.obscureText = false,
      this.onSuffixPressed,
      this.height,
      this.onChanged,
      this.autovalidateMode,
      this.autofillHints});
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,

      // padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: AppColors.transparent,
      ),

      child: TextFormField(
        textCapitalization: widget.keyboardType == TextInputType.name
            ? TextCapitalization.words
            : TextCapitalization.sentences,
        autofillHints: widget.autofillHints,
        onChanged: widget.onChanged,
        controller: widget.controller,
        onFieldSubmitted: widget.onSubmited,
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterValue + widget.hint;
              } else {
                return null;
              }
            },
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIconColor: WidgetStateColor.resolveWith((states) =>
                states.contains(WidgetState.focused)
                    ? Colors.blue
                    : Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // semanticCounterText: widget.hint,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 16,
                    // color: ColorManager.black,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            alignLabelWithHint: true,
            labelStyle: getRegularStyle(
                color: AppColors.black, fontSize: widget.fontSize),
            labelText: widget.hint,
            hintStyle: getRegularStyle(
                color: AppColors.grey, fontSize: widget.fontSize),
            suffixIconConstraints: const BoxConstraints(maxHeight: 16),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onSuffixPressed ?? () {},
                    icon: Icon(
                      widget.suffixIcon,
                      size: 16,
                      color: AppColors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
