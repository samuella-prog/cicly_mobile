import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/buttons/main_action_button.dart';

class BlueActionButton extends CustomActionButton {
  BlueActionButton({
    required super.onPressed,
    required super.text,
    required super.icon,
    super.key,
  }) : super(backgroundColor: CustomColorScheme().blue);
}
