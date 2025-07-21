import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
import 'screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  // Assure que Flutter est initialisé
  WidgetsFlutterBinding.ensureInitialized();

  // Orientation portrait uniquement
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const JangoraApp());
}

class JangoraApp extends StatelessWidget {
  const JangoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jangora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}