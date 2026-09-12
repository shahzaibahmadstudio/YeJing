import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object?> get props => [];
}

class ScanImagePickedEvent extends ScanEvent {
  final ImageSource source;

  const ScanImagePickedEvent({required this.source});

  @override
  List<Object?> get props => [source];
}

class ScanProcessEvent extends ScanEvent {
  const ScanProcessEvent();
}

class ScanResetEvent extends ScanEvent {
  const ScanResetEvent();
}

class ScanErrorEvent extends ScanEvent {
  final String message;

  const ScanErrorEvent({required this.message});

  @override
  List<Object?> get props => [message];
}