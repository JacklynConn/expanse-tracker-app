import '/resources/app_colours.dart';
import '/resources/app_spacing.dart';
import 'package:flutter/material.dart';

class CheckboxInputComponent extends StatefulWidget {
  final bool value;
  final Widget? label;
  final bool isEnable;
  final ValueChanged<bool?> onChanged;

  const CheckboxInputComponent({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isEnable = true,
  });

  @override
  State<CheckboxInputComponent> createState() => _CheckboxInputComponentState();
}

class _CheckboxInputComponentState extends State<CheckboxInputComponent> {
  late bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            activeColor: AppColours.primaryColour,
            checkColor: Colors.white,
            side: BorderSide(color: AppColours.primaryColour),
            value: value,
            onChanged: widget.isEnable
                ? (bool? newValue) {
                    setState(() {
                      value = newValue!;
                      widget.onChanged(value);
                    });
                  }
                : null,
          ),
        ),
        if (widget.label != null) ...[
          AppSpacing.horizontal(size: 4),
          Expanded(child: widget.label!),
        ]
      ],
    );
  }
}
