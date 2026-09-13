import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @yejingTitle.
  ///
  /// In en, this message translates to:
  /// **'YeJing'**
  String get yejingTitle;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get appVersion;

  /// No description provided for @appDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'YeJing uses AI-powered image recognition to deliver instant plant disease diagnosis. Results are indicative only and not a substitute for professional agronomic advice.'**
  String get appDisclaimer;

  /// No description provided for @plantDiseaseDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Plant Disease Diagnosis'**
  String get plantDiseaseDiagnosis;

  /// No description provided for @navScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get navScan;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get settingsLanguageLabel;

  /// No description provided for @settingsDataLabel.
  ///
  /// In en, this message translates to:
  /// **'DATA'**
  String get settingsDataLabel;

  /// No description provided for @settingsClearHistoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get settingsClearHistoryLabel;

  /// No description provided for @settingsAboutLabel.
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get settingsAboutLabel;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a Plant'**
  String get scanTitle;

  /// No description provided for @scanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload an image of a leaf.'**
  String get scanSubtitle;

  /// No description provided for @scanFileHint.
  ///
  /// In en, this message translates to:
  /// **'JPEG or PNG - Max 5MB'**
  String get scanFileHint;

  /// No description provided for @scanAnalyzeButton.
  ///
  /// In en, this message translates to:
  /// **'Analyze Plant'**
  String get scanAnalyzeButton;

  /// No description provided for @scanAnalyzingLabel.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get scanAnalyzingLabel;

  /// No description provided for @scanTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get scanTakePhoto;

  /// No description provided for @scanChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get scanChooseFromGallery;

  /// No description provided for @scanDiagnosisResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis Result'**
  String get scanDiagnosisResultTitle;

  /// No description provided for @scanDiseaseLabel.
  ///
  /// In en, this message translates to:
  /// **'DISEASE'**
  String get scanDiseaseLabel;

  /// No description provided for @scanTreatmentLabel.
  ///
  /// In en, this message translates to:
  /// **'TREATMENT'**
  String get scanTreatmentLabel;

  /// No description provided for @scanErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get scanErrorTitle;

  /// No description provided for @scanRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get scanRetryButton;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan History'**
  String get historyTitle;

  /// No description provided for @historyRecordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 records} =1{1 record} other{{count} records}}'**
  String historyRecordsCount(num count);

  /// No description provided for @historySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get historySearchHint;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan a plant to get started.'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'No scans yet.'**
  String get historyEmptySubtitle;

  /// No description provided for @historyNoResults.
  ///
  /// In en, this message translates to:
  /// **'No matching scans.'**
  String get historyNoResults;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
