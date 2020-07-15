import 'package:flutter/material.dart';

import 'package:dreadscout/page/home_page.dart';

/// [DreadScout] is the top-level class for the application.
///
/// Defined as the top-level Flutter Application.
class DreadScout extends StatelessWidget {
  /// Top-Level Application Data.
  ///
  /// Includes both the official application name [applicationName]
  /// and the current version in code [applicationVersion].
  final String applicationName = 'DreadScout';
  final String applicationVersion = 'v.1.1.1';

  /// Application Color Theme [colorTheme]
  ///
  /// Color Swatches are collections of color. Using
  /// [Colors.bleuGrey] as a basis for dreadscout's dark,
  /// dreadbot-ish theme.
  final ColorSwatch colorTheme = Colors.blueGrey;

  /// The Platform Visual Density of the Application. [platformVisualDensity]
  ///
  /// This makes the visual density adapt to the platform that you run
  /// the app on. For desktop platforms, the controls will be smaller and
  /// closer together (more dense) than on mobile platforms.
  final VisualDensity platformVisualDensity = VisualDensity.adaptivePlatformDensity;

  /// Standard Build Method of the Application. [build]
  ///
  /// Entry point for the application, overrides
  /// Flutter's default Widget.build(BuildContext) method.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Official Application Title.
      title: applicationName,
      theme: ThemeData(
        primarySwatch: colorTheme,

        visualDensity: platformVisualDensity,
      ),
      home: DreadScoutHomePage(
          title: "$applicationName $applicationVersion"
      ),
    );
  }
}