import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/providers/notifier/theme_prefernce_notifier.dart';
import 'router/app_router.dart';
import 'shared/theme/theme_color.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final colorTheme = ColorTheme();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Planet Explorer',
      themeMode: themeMode,
      theme: colorTheme.lightTheme,
      darkTheme: colorTheme.darkTheme,
      routerConfig: router,
    );
  }
}
