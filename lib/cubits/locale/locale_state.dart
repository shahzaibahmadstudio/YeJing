import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum AppLanguage { en, zh }

extension AppLanguageX on AppLanguage {
  Locale get locale {
    switch (this) {
      case AppLanguage.en:
        return const Locale('en');
      case AppLanguage.zh:
        return const Locale('zh');
    }
  }

  String get toggleLabel {
    switch (this) {
      case AppLanguage.en:
        return '中文';
      case AppLanguage.zh:
        return 'ENG';
    }
  }

  String get displayName {
    switch (this) {
      case AppLanguage.en:
        return 'English';
      case AppLanguage.zh:
        return '中文';
    }
  }
}

class AppLocaleState extends Equatable {
  final AppLanguage language;

  const AppLocaleState({required this.language});

  AppLocaleState copyWith({AppLanguage? language}) {
    return AppLocaleState(language: language ?? this.language);
  }

  @override
  List<Object?> get props => [language];
}
