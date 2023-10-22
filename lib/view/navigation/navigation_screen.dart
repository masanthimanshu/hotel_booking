import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/components/navigation/bottom_navbar.dart';
import 'package:hotel_booking/components/navigation/custom_appbar.dart';
import 'package:hotel_booking/view/explore/explore_screen.dart';
import 'package:hotel_booking/view/favourite/favourite_screen.dart';
import 'package:hotel_booking/view/home/home_screen.dart';

class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  final List _pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const FavouriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(bottomNavbarProvider);

    return Scaffold(
      body: _pages[res],
      appBar: CustomAppBar(context: context),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
