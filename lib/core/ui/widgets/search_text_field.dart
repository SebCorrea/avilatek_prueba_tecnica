import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:avilatek_prueba_tecnica/core/ui/utils/ui_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchTextField extends StatelessWidget {
  final void Function(String value)? onChanged;
  final bool autofocus;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  const SearchTextField({
    super.key,
    this.onChanged,
    this.autofocus = false,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: TextInputType.text,
      placeholder: UIStrings.searchLabel,
      style: context.textTheme.bodyLarge,
      placeholderStyle: context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.outlineVariant),
      prefix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          Icons.search,
          color: context.colorScheme.outlineVariant,
        ),
      ),
      suffix: suffixIcon,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: context.colorScheme.surface,
      ),
    );
  }
}