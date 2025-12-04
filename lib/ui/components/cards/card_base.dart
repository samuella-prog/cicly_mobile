import 'package:cicly/assets/custom_color_scheme.dart';
import 'package:flutter/material.dart';

/// A base card widget that displays a title, description, and child content.
/// The card has a black background with a shadow effect.
/// This component should be used as it is for symptoms such as mood or pain related symptoms.
/// For other types of symptoms, consider creating specialized card components.
/// Parameters:
/// - [title]: The title text displayed at the top of the card.
/// - [description]: The description text displayed below the title.
/// - [child]: The main content widget displayed within the card.
class CardBase extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;
  const CardBase({
    super.key,
    required this.child,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      decoration: BoxDecoration(
        color: CustomColorScheme().surface,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 24,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: CustomColorScheme().pink,
              decorationThickness: 4,
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          child,
        ],
      ),
    );
  }
}
