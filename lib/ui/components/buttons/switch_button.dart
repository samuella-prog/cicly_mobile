import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchButton({super.key, required this.value, required this.onChanged});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbColor: WidgetStateProperty.all(Colors.black),
      onChanged: (newValue) {
        widget.onChanged(newValue);
      },
      value: widget.value,
      inactiveTrackColor: CustomColorScheme().blue,
      activeTrackColor: CustomColorScheme().pink,
      trackOutlineColor: WidgetStateProperty.all(Colors.black),
      trackOutlineWidth: WidgetStateProperty.all(3),
      dragStartBehavior: DragStartBehavior.start,
    );
  }
}
