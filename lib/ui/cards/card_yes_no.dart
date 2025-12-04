import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:cicly/ui/buttons/round_icon_button.dart';
import 'package:cicly/ui/cards/card_base.dart';
import 'package:flutter/material.dart';

/// A card widget that presents a yes/no choice to the user.
/// This component can be used for symptoms that require a binary input, such as "Did you experience nausea today?".
/// Parameters:
/// - [title]: The title text displayed at the top of the card.
/// - [description]: The description text displayed below the title.
class CardYesNo extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onNoPressed;
  final void Function() onYesPressed;
  const CardYesNo({
    super.key,
    required this.title,
    required this.description,
    required this.onNoPressed,
    required this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CardBase(
      title: title,
      description: description,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundIconButton(
            icon: Icons.cancel,
            size: 100,
            onPressed: onNoPressed,
            backgroundColor: CustomColorScheme().blue,
          ),
          RoundIconButton(
            icon: Icons.check_circle,
            size: 100,
            onPressed: onYesPressed,
            backgroundColor: CustomColorScheme().pink,
          ),
        ],
      ),
    );
  }
}
