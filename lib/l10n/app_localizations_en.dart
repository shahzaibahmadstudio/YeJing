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

  @override
  String get scanTitle => 'Scan a Plant';

  @override
  String get scanSubtitle => 'Tap to upload an image of a leaf.';

  @override
  String get scanFileHint => 'JPEG or PNG - Max 5MB';

  @override
  String get scanAnalyzeButton => 'Analyze Plant';

  @override
  String get scanAnalyzingLabel => 'Analyzing...';

  @override
  String get scanTakePhoto => 'Take Photo';

  @override
  String get scanChooseFromGallery => 'Choose from Gallery';

  @override
  String get scanDiagnosisResultTitle => 'Diagnosis Result';

  @override
  String get scanDiseaseLabel => 'DISEASE';

  @override
  String get scanTreatmentLabel => 'TREATMENT';

  @override
  String get scanErrorTitle => 'Something went wrong.';

  @override
  String get scanRetryButton => 'Try Again';

  @override
  String get historyTitle => 'Scan History';

  @override
  String historyRecordsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records',
      one: '1 record',
      zero: '0 records',
    );
    return '$_temp0';
  }

  @override
  String get historySearchHint => 'Search';

  @override
  String get historyEmptyTitle => 'Scan a plant to get started.';

  @override
  String get historyEmptySubtitle => 'No scans yet.';

  @override
  String get historyNoResults => 'No matching scans.';

  @override
  String get historyClearedMessage => 'History cleared.';

  @override
  String get connectivityNoInternet => 'No Internet Connection';
}
