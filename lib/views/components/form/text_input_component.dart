import '/resources/app_colours.dart';
import '/resources/app_spacing.dart';
import '/resources/app_strings.dart';
import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  final bool isRequired;
  final bool isEnabled;
  final String label;
  final bool isPassword;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? textInputType;

  const TextInputComponent({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.textEditingController,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.textInputType,
    this.isRequired = false,
    this.isEnabled = true,
  });

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.isRequired && value!.isEmpty || value == null) {
          return AppStrings.inputIsRequired.replaceAll(":input", widget.label);
        }
        return null;
      },
      obscureText: widget.isPassword && !showPassword,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: AppColours.light20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColours.light20.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColours.light20.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColours.primaryColour,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  togglePassword();
                },
                icon: Icon(
                  showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColours.light20,
                ),
              )
            : AppSpacing.empty(),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}
