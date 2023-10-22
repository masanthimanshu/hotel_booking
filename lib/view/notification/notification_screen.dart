import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active_outlined,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Notifications",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We'll let you know when we've got something new for you.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
