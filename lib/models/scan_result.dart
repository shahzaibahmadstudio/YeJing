import 'package:equatable/equatable.dart';
import 'package:yejing/models/disease_label.dart';

class ScanResult extends Equatable {
  final String id;
  final String imagePath;
  final String title;
  final DateTime date;
  final DiseaseLabel severity;
  final String description;
  final String treatment;

  const ScanResult({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.severity,
    required this.description,
    required this.treatment,
  });

  ScanResult copyWith({
    String? id,
    String? imagePath,
    String? title,
    DateTime? date,
    DiseaseLabel? severity,
    String? description,
    String? treatment,
  }) {
    return ScanResult(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      date: date ?? this.date,
      severity: severity ?? this.severity,
      description: description ?? this.description,
      treatment: treatment ?? this.treatment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'title': title,
      'date': date.toIso8601String(),
      'severity': severity.name,
      'description': description,
      'treatment': treatment,
    };
  }

  factory ScanResult.fromMap(Map<String, dynamic> map) {
    return ScanResult(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
      date: DateTime.parse(map['date'] as String),
      severity: DiseaseLabel.values.firstWhere(
        (e) => e.name == map['severity'],
        orElse: () => DiseaseLabel.mild,
      ),
      description: map['description'] as String,
      treatment: map['treatment'] as String,
    );
  }

  @override
  List<Object?> get props => [
    id,
    imagePath,
    title,
    date,
    severity,
    description,
    treatment,
  ];
}
