import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  CustomChoiceChipState createState() => CustomChoiceChipState();
}

class CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ChoiceChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(widget.text),
        selected: widget.isSelected,
        onSelected: widget.onSelected,
        selectedColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).highlightColor,
        labelStyle: TextStyle(
          color: widget.isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
