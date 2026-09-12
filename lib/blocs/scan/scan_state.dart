import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:yejing/models/scan_result.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitialState extends ScanState {
  const ScanInitialState();
}

class ScanImageSelectedState extends ScanState {
  final File imageFile;

  const ScanImageSelectedState({required this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class ScanProcessingState extends ScanState {
  final File imageFile;

  const ScanProcessingState({required this.imageFile});

  @override
  List<Object?> get props => [imageFile];
}

class ScanResultState extends ScanState {
  final ScanResult result;

  const ScanResultState({required this.result});

  @override
  List<Object?> get props => [result];
}

class ScanErrorState extends ScanState {
  final String message;
  final File? imageFile;

  const ScanErrorState({required this.message, this.imageFile});

  @override
  List<Object?> get props => [message, imageFile];
}
