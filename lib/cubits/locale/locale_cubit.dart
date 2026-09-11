import 'dart:ui';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yejing/cubits/locale/locale_state.dart';

class AppLocaleCubit extends HydratedCubit<AppLocaleState> {
  AppLocaleCubit() : super(AppLocaleState(language: _resolveDeviceLanguage()));

  static AppLanguage _resolveDeviceLanguage() {
    final String deviceLanguageCode =
        PlatformDispatcher.instance.locale.languageCode;
    if (deviceLanguageCode == 'zh') return AppLanguage.zh;
    return AppLanguage.en;
  }

  void toggleLanguage() {
    final AppLanguage next = state.language == AppLanguage.en
        ? AppLanguage.zh
        : AppLanguage.en;
    emit(state.copyWith(language: next));
  }

  @override
  AppLocaleState? fromJson(Map<String, dynamic> json) {
    try {
      final String? code = json['language'] as String?;
      final AppLanguage language = AppLanguage.values.firstWhere(
        (lang) => lang.name == code,
        orElse: _resolveDeviceLanguage,
      );
      return AppLocaleState(language: language);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppLocaleState state) {
    return {'language': state.language.name};
  }
}