import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/components/buttons/main_action_button.dart';

class PinkActionButton extends CustomActionButton {
  PinkActionButton({
    required super.onPressed,
    required super.text,
    required super.icon,
    super.key,
  }) : super(backgroundColor: CustomColorScheme().pink);
}
