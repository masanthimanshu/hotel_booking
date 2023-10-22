import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 2,
      ),
      itemBuilder: (e, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }
}
