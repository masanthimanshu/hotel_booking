import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/components/custom_icon_button.dart';
import 'package:hotel_booking/components/navigation/bottom_navbar.dart';
import 'package:hotel_booking/view/notification/notification_screen.dart';
import 'package:hotel_booking/view/profile/profile_screen.dart';

final User _user = FirebaseAuth.instance.currentUser!;

class CustomAppBar extends AppBar {
  CustomAppBar({required BuildContext context, super.key})
      : super(
          leading: CustomIconButton(
            icon: const Icon(Icons.person),
            buttonMethod: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Consumer(
              builder: (context, ref, child) {
                final res = ref.watch(bottomNavbarProvider);

                if (res == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _user.displayName ?? "",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  );
                } else if (res == 1) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Search for any destination",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Favourites,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Your favourite destinations",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
        );
}
