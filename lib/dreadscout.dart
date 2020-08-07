/*
The MIT License (MIT)

Copyright (c) 2020 Collin Johnson/FRC Team 3656

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 */

import 'package:dreadscout/ui/home_page.dart';
import 'package:intl/intl.dart';

import 'package:logging/logging.dart';

import 'package:flutter/material.dart';

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

  /// [Logger] object for logging utilities.
  ///
  /// This class is from the logging package for Dart.
  final Logger logger;

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
  final VisualDensity platformVisualDensity =
      VisualDensity.adaptivePlatformDensity;

  /// Default [DreadScout] constructor.
  ///
  /// This provides logging functionality to future classes.
  DreadScout(this.logger) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final DateFormat dateFormatter = DateFormat('HH:mm:ss');
      final String formattedDateTime = dateFormatter.format(record.time);

      final String formattedLogMessage = '[$formattedDateTime ${record.level}]: ${record.message}';
      print(formattedLogMessage);
    });

    logger.info('Starting $applicationName $applicationVersion...');
  }

  /// Standard Build Method of the Application. [build]
  ///
  /// Entry point for the application, overrides
  /// Flutter's default Widget.build(BuildContext) method.
  @override
  Widget build(BuildContext context) {
    logger.info('Building Core App Widget... $context');

    return MaterialApp(
      // Official Application Title.
      title: applicationName,
      theme: ThemeData(
        primarySwatch: colorTheme,
        visualDensity: platformVisualDensity,
      ),
      home: DreadScoutHomePage(title: "$applicationName $applicationVersion"),
    );
  }
}
