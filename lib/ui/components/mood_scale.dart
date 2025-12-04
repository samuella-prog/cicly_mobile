import 'package:cicly/ui/components/buttons/scale_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class MoodScale extends StatefulWidget {
  final void Function(String) onMoodSelected;

  const MoodScale({super.key, required this.onMoodSelected});

  @override
  _MoodScaleState createState() => _MoodScaleState();
}

class _MoodScaleState extends State<MoodScale> {
  String _selectedMood = 'happy';

  void _handleMoodSelection(String mood) {
    setState(() {
      _selectedMood = mood;
    });
    widget.onMoodSelected(_selectedMood);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            'Quelle est ton humeur aujourd\'hui ?',
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          child: Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('sad')},
                text: 'triste',
                icon: Symbols.sentiment_dissatisfied,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('neutral')},
                text: 'neutre',
                icon: Symbols.sentiment_neutral,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('happy')},
                text: 'heureux.se',
                icon: Symbols.sentiment_satisfied,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('stressed')},
                text: 'stressé.e',
                icon: Symbols.sentiment_stressed,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('angry')},
                text: 'en colère',
                icon: Symbols.sentiment_extremely_dissatisfied,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('depressed')},
                text: 'déprimé.e',
                icon: Symbols.sentiment_sad,
              ),
              ScaleIconButton(
                onPressed: () => {_handleMoodSelection('very depressed')},
                text: 'très déprimé.e',
                icon: Symbols.sentiment_frustrated,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
