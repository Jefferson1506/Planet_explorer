import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'src/core/providers/notifier/theme_prefernce_notifier.dart';
import 'src/core/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Planet Explorer',
      themeMode: themeNotifier.themeMode,
      theme: themeNotifier.lightTheme,
      darkTheme: themeNotifier.darkTheme,
      routerConfig: router,
      builder: EasyLoading.init(),
    );
  }
}
