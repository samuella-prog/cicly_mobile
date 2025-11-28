import 'package:cicly/ui/buttons/scale_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PainScale extends StatefulWidget {
  final void Function(int) onScaleSelected;

  const PainScale({super.key, required this.onScaleSelected});

  @override
  PainScaleState createState() => PainScaleState();
}

class PainScaleState extends State<PainScale> {
  int _selectedScale = 0;

  void _handleScaleSelection(int scale) {
    setState(() {
      _selectedScale = scale;
    });
    widget.onScaleSelected(_selectedScale);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            'Quel est ton niveau de douleur aujourd\'hui ?',
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
            spacing: 0,
            alignment: WrapAlignment.center,
            children: [
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(0)},
                text: '0-1',
                icon: Symbols.sentiment_satisfied,
              ),
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(2)},
                text: '2-3',
                icon: Symbols.sentiment_calm,
              ),
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(4)},
                text: '4-5',
                icon: Symbols.sentiment_neutral,
              ),
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(6)},
                text: '6-7',
                icon: Symbols.sentiment_dissatisfied,
              ),
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(8)},
                text: '8-9',
                icon: Symbols.sentiment_sad,
              ),
              ScaleIconButton(
                onPressed: () => {_handleScaleSelection(10)},
                text: '10',
                icon: Symbols.sentiment_frustrated,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
