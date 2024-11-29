import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class AppDropDownField extends StatelessWidget {
  const AppDropDownField(
      {super.key,
      this.value,
      this.height,
      this.prefixIcon,
      required this.itemList,
      required this.hint,
      required this.onChanged});
  final Object? value;
  final List itemList;
  final String hint;
  final Function(Object?) onChanged;
  final double? height;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      height: height ?? 30,
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 8,
      // ),
      decoration: BoxDecoration(
        // border: Border.fromBorderSide(BorderSide(
        //   width: 1,
        //   color: AppColors.grey,
        // )),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 16,
                  color: AppColors.primary,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              style: getRegularStyle(color: AppColors.black, fontSize: 14),
              value: value,
              items: itemList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              hint: SizedBox(
                child: Text(
                  hint,
                  style: getRegularStyle(color: AppColors.grey, fontSize: 14),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
