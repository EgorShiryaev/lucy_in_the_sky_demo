import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'presentation/bloc/currencies_cubit.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/themes/app_theme.dart';

Future<void> main() async {
  await dependencyInjection();

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
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
