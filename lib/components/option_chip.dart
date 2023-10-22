import 'package:flutter/material.dart';

class OptionChip extends StatelessWidget {
  const OptionChip({
    super.key,
    required this.name,
    required this.isSelected,
  });

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? Colors.black : Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
