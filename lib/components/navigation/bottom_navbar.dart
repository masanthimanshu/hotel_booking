import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavbarProvider = StateProvider((ref) => 0);

class BottomNavbar extends ConsumerStatefulWidget {
  const BottomNavbar({super.key});

  @override
  ConsumerState<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends ConsumerState<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(bottomNavbarProvider);

    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: Colors.grey.shade200,
      onTap: (e) {
        ref.read(bottomNavbarProvider.notifier).update((state) => e);
      },
      items: [
        Icon(res == 0 ? Icons.home : Icons.home_outlined),
        Icon(res == 1 ? Icons.explore : Icons.explore_outlined),
        Icon(res == 2 ? Icons.favorite : Icons.favorite_outline),
      ],
    );
  }
}
