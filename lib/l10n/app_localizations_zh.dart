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

  @override
  String get scanTitle => '扫描植物';

  @override
  String get scanSubtitle => '点击上传一张叶子的图片。';

  @override
  String get scanFileHint => 'JPEG 或 PNG - 最大 5MB';

  @override
  String get scanAnalyzeButton => '分析工厂';

  @override
  String get scanAnalyzingLabel => '正在分析……';

  @override
  String get scanTakePhoto => '拍照';

  @override
  String get scanChooseFromGallery => '从图库选择';

  @override
  String get scanDiagnosisResultTitle => '诊断结果';

  @override
  String get scanDiseaseLabel => '疾病';

  @override
  String get scanTreatmentLabel => '治疗';

  @override
  String get scanErrorTitle => '出了一些问题。';

  @override
  String get scanRetryButton => '再试一次';

  @override
  String get historyTitle => '扫描历史';

  @override
  String historyRecordsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条记录',
    );
    return '$_temp0';
  }

  @override
  String get historySearchHint => '搜索';

  @override
  String get historyEmptyTitle => '扫描植物以开始使用。';

  @override
  String get historyEmptySubtitle => '暂无扫描记录。';

  @override
  String get historyNoResults => '未找到匹配的记录。';
}
