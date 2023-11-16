import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/di/dependency_injection.dart';
import 'presentation/bloc/currencies_cubit/currencies_cubit.dart';
import 'presentation/bloc/currency_settings_cubit/currency_settings_cubit.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/themes/app_theme.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dependencyInjection();
  Timer(const Duration(milliseconds: 750), FlutterNativeSplash.remove);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrenciesCubit>(
          create: (context) => getIt<CurrenciesCubit>()..load(),
        ),
        BlocProvider<CurrencySettingsCubit>(
          create: (context) => getIt<CurrencySettingsCubit>(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
