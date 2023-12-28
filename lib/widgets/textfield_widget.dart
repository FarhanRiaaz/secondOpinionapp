import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final IconData? icon;
  final String? hint;
  final Widget? suffixIcon;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final int maxLines;
  final String? imageIcon;
  final Function? onTap;
  bool isReadOnly;
  final TextStyle? textStyle;
  final int? maxLength;

  final List<TextInputFormatter>? inputFormat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        validator: validator,
        inputFormatters: inputFormat ?? [],
        readOnly: isReadOnly,
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : () {},
        controller: textController,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: maxLength ?? 40,
        maxLines: this.maxLines,
        keyboardType: this.inputType,
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        decoration: errorText != null
            ? InputDecoration(
                prefixIcon: this.imageIcon == null
                    ? this.icon != null
                        ? Icon(this.icon)
                        : null
                    : ImageIcon(AssetImage(this.imageIcon!)),
                hintText: this.hint,
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
                errorText: errorText,
                counterText: '',
                suffixIcon: suffixIcon

                // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
                )
            : InputDecoration(
                prefixIcon: this.imageIcon == null
                    ? this.icon != null
                        ? Icon(this.icon)
                        : null
                    : ImageIcon(AssetImage(this.imageIcon!)),
                hintText: this.hint,
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
                counterText: '',
                suffixIcon: suffixIcon
                // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
                ),
      ),
    );
  }

  TextFieldWidget({
    Key? key,
    this.validator,
    this.inputFormat,
    this.icon,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.suffixIcon,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.imageIcon,
    this.onTap,
    this.textStyle,
    this.maxLength,
  }) : super(key: key);
}

class TextFieldPasswordWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final int maxLines;
  final String? imageIcon;
  final Function onPasswordToggle;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: maxLength ?? 100,
        maxLines: this.maxLines,
        keyboardType: this.inputType,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: errorText != null
            ? InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    onPasswordToggle();
                  },
                  icon: Icon(isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                ),
                prefixIcon: this.imageIcon == null
                    ? this.icon != null
                        ? Icon(this.icon)
                        : null
                    : ImageIcon(AssetImage(this.imageIcon!)),

                hintText: this.hint,
                errorMaxLines: 2,
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
                errorText: errorText,
                counterText: '',
                // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
              )
            : InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    onPasswordToggle();
                  },
                  icon: Icon(isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                ),
                prefixIcon: this.imageIcon == null
                    ? this.icon != null
                        ? Icon(this.icon)
                        : null
                    : ImageIcon(AssetImage(this.imageIcon!)),

                hintText: this.hint,
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),

                counterText: '',
                // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
              ),
      ),
    );
  }

  const TextFieldPasswordWidget({
    Key? key,
    required this.onPasswordToggle,
    this.icon,
    this.maxLength,
    this.maxLines = 1,
    this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.imageIcon,
  }) : super(key: key);
}
