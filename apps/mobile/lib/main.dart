import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joonak/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: JoonakApp()));
}

class JoonakApp extends ConsumerWidget {
  const JoonakApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Joonak',
      routerConfig: router,
    );
  }
}
