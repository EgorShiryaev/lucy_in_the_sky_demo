// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:lucy_in_the_sky_demo/domain/entities/currency.dart' as _i5;
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
      final args = routeData.argsAs<SettingsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SettingsScreen(
          key: args.key,
          currencies: args.currencies,
        ),
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
class SettingsRoute extends _i3.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i4.Key? key,
    required List<_i5.Currency> currencies,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            key: key,
            currencies: currencies,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i3.PageInfo<SettingsRouteArgs> page =
      _i3.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    this.key,
    required this.currencies,
  });

  final _i4.Key? key;

  final List<_i5.Currency> currencies;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, currencies: $currencies}';
  }
}
