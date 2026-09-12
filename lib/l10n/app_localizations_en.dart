// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get yejingTitle => 'YeJing';

  @override
  String get appVersion => 'Version 1.0.0';

  @override
  String get appDisclaimer =>
      'YeJing uses AI-powered image recognition to deliver instant plant disease diagnosis. Results are indicative only and not a substitute for professional agronomic advice.';

  @override
  String get plantDiseaseDiagnosis => 'Plant Disease Diagnosis';

  @override
  String get navScan => 'Scan';

  @override
  String get navHistory => 'History';

  @override
  String get navSettings => 'Settings';

  @override
  String get settingsLanguageLabel => 'LANGUAGE';

  @override
  String get settingsDataLabel => 'DATA';

  @override
  String get settingsClearHistoryLabel => 'Clear History';

  @override
  String get settingsAboutLabel => 'ABOUT';
}
