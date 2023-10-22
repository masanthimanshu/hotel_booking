import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/firebase_options.dart';
import 'package:hotel_booking/utils/root.dart';
import 'package:hotel_booking/utils/theme.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GlobalLoaderOverlay(
      overlayOpacity: 0.8,
      useDefaultLoading: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RootElement(),
        theme: themeData,
      ),
    );
  }
}
