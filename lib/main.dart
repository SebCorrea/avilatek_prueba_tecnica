
import 'package:avilatek_prueba_tecnica/config/routes/router.dart';
import 'package:avilatek_prueba_tecnica/core/services/dot_env/dot_env_service.dart';
import 'package:avilatek_prueba_tecnica/features/configuration/ui/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/get_it/injection_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnvService.init();
  await injector.injectAll();

  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSate = context.watch<ThemeBloc>().state;
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: themeSate.appTheme.build(context),
    );
  }
}

