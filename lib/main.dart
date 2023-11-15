import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'presentation/bloc/currency_rates_cubit.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/themes/app_theme.dart';

void main() async {
  dependencyInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyRatesCubit>(
          create: (context) => getIt<CurrencyRatesCubit>()..load(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
