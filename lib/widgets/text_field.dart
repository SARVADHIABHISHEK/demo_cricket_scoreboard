import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;
  final InputDecoration inputDecoration;
  final TextStyle style;
  final TextAlign textAlign;
  final GestureTapCallback onTap;
  final bool obscureText;
  final bool readonly;
  final TextInputAction textInputAction;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final TextCapitalization textCapitalization;
  final bool enable;
  final double width;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String>  validator;


  const Input({
    Key key,
    this.text,
    this.controller,
    this.keyboardType,
    this.onEditingComplete,
    this.focusNode,
    this.inputDecoration,
    this.style,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.obscureText = false,
    this.readonly = false,
    this.textInputAction = TextInputAction.next,
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.enable,
    this.width,
    this.inputFormatters,this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Text(
              text ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: width,
            child: TextFormField(
                validator: validator,
                enabled: enable,
                keyboardType: keyboardType,
                controller: controller,
                focusNode: focusNode,
                textAlign: textAlign,
                onTap: onTap,
                obscureText: obscureText,
                readOnly: readonly,
                textInputAction: textInputAction,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                textCapitalization: textCapitalization,
                cursorColor: Colors.black,
                inputFormatters: inputFormatters,
                style: TextStyle(
                        fontSize: 13.sp,
                        decoration: TextDecoration.none,
                        height: 1.0)
                    .merge(style),
                decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.w),
                            borderSide: const BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black)))
                    .copyWith(
                  icon: inputDecoration?.icon,
                  iconColor: inputDecoration?.iconColor,
                  label: inputDecoration?.label,
                  hintText: inputDecoration?.hintText,
                  hintStyle: inputDecoration?.hintStyle,
                  hintTextDirection: inputDecoration?.hintTextDirection,
                  hintMaxLines: inputDecoration?.hintMaxLines,
                  alignLabelWithHint: inputDecoration?.alignLabelWithHint,
                  filled: inputDecoration?.filled,
                  fillColor: inputDecoration?.fillColor,
                  labelText: inputDecoration?.labelText,
                  labelStyle: inputDecoration?.labelStyle,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  helperMaxLines: inputDecoration?.hintMaxLines,
                  helperText: inputDecoration?.helperText,
                  helperStyle: inputDecoration?.helperStyle,
                  errorText: inputDecoration?.errorText,
                  errorStyle: inputDecoration?.errorStyle,
                  errorBorder: inputDecoration?.errorBorder,
                  errorMaxLines: inputDecoration?.errorMaxLines,
                  focusedErrorBorder: inputDecoration?.focusedErrorBorder,
                  isDense: inputDecoration?.isDense,
                  isCollapsed: inputDecoration?.isCollapsed,
                  contentPadding: inputDecoration?.contentPadding,
                  prefix: inputDecoration?.prefix,
                  prefixText: inputDecoration?.prefixText,
                  prefixStyle: inputDecoration?.prefixStyle,
                  prefixIcon: inputDecoration?.prefixIcon,
                  prefixIconColor: inputDecoration?.prefixIconColor,
                  prefixIconConstraints: inputDecoration?.prefixIconConstraints,
                  suffix: inputDecoration?.suffix,
                  suffixIcon: inputDecoration?.suffixIcon,
                  suffixIconColor: inputDecoration?.suffixIconColor,
                  suffixText: inputDecoration?.suffixText,
                  suffixStyle: inputDecoration?.suffixStyle,
                  suffixIconConstraints: inputDecoration?.suffixIconConstraints,
                  semanticCounterText: inputDecoration?.semanticCounterText,
                  counter: inputDecoration?.counter,
                  counterText: inputDecoration?.counterText,
                  counterStyle: inputDecoration?.counterStyle,
                )),
          ),
        ],
      ),
    );
  }
}
