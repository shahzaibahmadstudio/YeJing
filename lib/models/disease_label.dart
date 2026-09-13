import 'package:flutter/material.dart';
import 'package:yejing/utils/constants.dart';

enum DiseaseLabel { mild, moderate, severe, healthy }

extension DiseaseLabelX on DiseaseLabel {
  Color get color {
    switch (this) {
      case DiseaseLabel.mild:
        return YeJingColors.accentMustard;
      case DiseaseLabel.moderate:
        return YeJingColors.accentOrange;
      case DiseaseLabel.severe:
        return YeJingColors.primaryRed;
      case DiseaseLabel.healthy:
        return YeJingColors.accentGreen;
    }
  }

  String get displayName {
    switch (this) {
      case DiseaseLabel.mild:
        return 'MILD';
      case DiseaseLabel.moderate:
        return 'MODERATE';
      case DiseaseLabel.severe:
        return 'SEVERE';
      case DiseaseLabel.healthy:
        return 'HEALTHY';
    }
  }
}
