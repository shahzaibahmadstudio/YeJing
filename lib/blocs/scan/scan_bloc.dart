import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:yejing/blocs/scan/scan_event.dart';
import 'package:yejing/blocs/scan/scan_state.dart';
import 'package:yejing/models/disease_label.dart';
import 'package:yejing/models/scan_result.dart';
import 'package:yejing/services/firebase/firebase_ai_service.dart';
import 'package:yejing/services/storage/hive_service.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final ImagePicker _imagePicker;
  final FirebaseAIService _firebaseAIService;

  ScanBloc({ImagePicker? imagePicker, FirebaseAIService? firebaseAIService})
    : _imagePicker = imagePicker ?? ImagePicker(),
      _firebaseAIService = firebaseAIService ?? FirebaseAIService(),
      super(const ScanInitialState()) {
    on<ScanImagePickedEvent>(_onImagePicked);
    on<ScanProcessEvent>(_onProcess);
    on<ScanResetEvent>(_onReset);
    on<ScanErrorEvent>(_onError);
  }

  Future<void> _onImagePicked(
    ScanImagePickedEvent event,
    Emitter<ScanState> emit,
  ) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: event.source,
        imageQuality: 85,
      );
      if (pickedFile == null) return;

      emit(ScanImageSelectedState(imageFile: File(pickedFile.path)));
    } catch (e) {
      emit(ScanErrorState(message: e.toString()));
    }
  }

  Future<void> _onProcess(
    ScanProcessEvent event,
    Emitter<ScanState> emit,
  ) async {
    final ScanState currentState = state;
    if (currentState is! ScanImageSelectedState) return;

    final File imageFile = currentState.imageFile;
    emit(ScanProcessingState(imageFile: imageFile));

    try {
      final ScanResult result = await _analyzeImage(imageFile);
      await HiveService.saveScan(result);
      emit(ScanResultState(result: result));
    } catch (e) {
      emit(ScanErrorState(message: e.toString(), imageFile: imageFile));
    }
  }

  void _onReset(ScanResetEvent event, Emitter<ScanState> emit) {
    emit(const ScanInitialState());
  }

  void _onError(ScanErrorEvent event, Emitter<ScanState> emit) {
    emit(ScanErrorState(message: event.message));
  }

  Future<ScanResult> _analyzeImage(File imageFile) async {
    try {
      final Map<String, dynamic> aiResponse = await _firebaseAIService
          .analyzePlantImage(imageFile);
      final String severityStr = (aiResponse['severity'] as String)
          .toLowerCase();
      final DiseaseLabel severity = DiseaseLabel.values.firstWhere(
        (label) => label.name == severityStr,
        orElse: () => DiseaseLabel.mild,
      );

      return ScanResult(
        id: const Uuid().v4(),
        imagePath: imageFile.path,
        title: aiResponse['disease_name'] as String? ?? 'Unknown',
        date: DateTime.now(),
        severity: severity,
        description: aiResponse['description'] as String? ?? '',
        treatment: aiResponse['treatment'] as String? ?? '',
      );
    } catch (e) {
      throw Exception('Failed to analyze image: $e');
    }
  }
}
