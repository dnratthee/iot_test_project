import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/utils/store.dart';
import 'package:iot_test_project/views/splash_screen_ui.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.sarabunTextTheme(baseTheme.textTheme),
    );
  }

  initializeDateFormatting("th_TH");

  runApp(MaterialApp(
      theme: _buildTheme(Brightness.light),
      debugShowCheckedModeBanner: true,
      home: const SplashScreenUI()));

  Store.init();
}
