import 'package:expanse_tracker/resources/app_colours.dart';
import 'package:expanse_tracker/resources/app_styles.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  final String label;
  final Widget? icon;
  final double? width;
  final ButtonType? type;

  const ButtonComponent(
      {super.key, required this.label, this.icon, this.type, this.width});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundColor: widget.type == ButtonType.secondary
              ? AppColours.primaryColour
              : Colors.white,
          backgroundColor: widget.type == ButtonType.secondary
              ? AppColours.primaryColourLight
              : AppColours.primaryColour,
        ),
        child: Text(
          widget.label,
          style: AppStyles.title3(
            color: widget.type == ButtonType.secondary
                ? AppColours.primaryColour
                : Colors.white,
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
}
