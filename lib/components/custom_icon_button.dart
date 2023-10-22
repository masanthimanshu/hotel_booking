import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.buttonMethod,
  });

  final Icon icon;
  final VoidCallback buttonMethod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonMethod,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
