// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:lucy_in_the_sky_demo/presentation/screens/currency_rates_screen.dart'
    as _i1;
import 'package:lucy_in_the_sky_demo/presentation/screens/settings_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CurrencyRatesRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CurrencyRatesScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CurrencyRatesScreen]
class CurrencyRatesRoute extends _i3.PageRouteInfo<void> {
  const CurrencyRatesRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CurrencyRatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrencyRatesRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SettingsScreen]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
