import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/controller/gender/gender_from_name.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String name = _auth.currentUser!.displayName!.split(" ")[0];

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Image.asset("assets/images/user_avatar.png", height: 200),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Name :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(_auth.currentUser!.displayName ?? ""),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Phone :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_auth.currentUser!.phoneNumber ?? ""),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Gender :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final res = ref.watch(genderFromNameProvider(name));

                  return res.hasValue
                      ? Text(res.value!.gender.toUpperCase())
                      : const Text("");
                }),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _auth.signOut(),
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
