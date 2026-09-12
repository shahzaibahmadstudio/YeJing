// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get yejingTitle => 'YeJing';

  @override
  String get appVersion => '版本 1.0.0';

  @override
  String get appDisclaimer =>
      'YeJing 利用人工智能图像识别技术，提供植物病害的即时诊断。诊断结果仅供参考，不能替代专业的农艺建议。';

  @override
  String get plantDiseaseDiagnosis => '植物病害诊断';

  @override
  String get navScan => '扫描';

  @override
  String get navHistory => '历史';

  @override
  String get navSettings => '设置';

  @override
  String get settingsLanguageLabel => '语言';

  @override
  String get settingsDataLabel => '数据';

  @override
  String get settingsClearHistoryLabel => '清除历史记录';

  @override
  String get settingsAboutLabel => '关于';
}
