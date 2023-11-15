import 'package:flutter/material.dart';
import 'package:flutter_practis/day55/core/theme.dart';

class ColorSelectionWidget extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  ColorSelectionWidget({required this.themeNotifier});

  @override
  State<ColorSelectionWidget> createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  List<Color> colors = [Colors.purple, Colors.indigo, Colors.red];

  List<String> namecolor = ["purple", "indiage", "red"];

  Color co = Colors.purple;

 
@override
  void initState() {
    
    widget.themeNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      colors.length,
      (index) => RadioListTile<Color>(
        title: Text(namecolor[index]),
        value: colors[index],
        groupValue: co,
        onChanged: (color) async {
          await widget.themeNotifier.updateColor(color!);
          co = color;
          setState(() {
            print(co.value);
          });
        },
      ),
    ));
  }
}
