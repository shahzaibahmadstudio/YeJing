import 'package:equatable/equatable.dart';
import 'package:yejing/models/scan_result.dart';

class HistoryState extends Equatable {
  final List<ScanResult> scans;
  final List<ScanResult> filteredScans;
  final DateTime? startDate;
  final DateTime? endDate;
  final String searchTitle;
  final bool isLoading;

  const HistoryState({
    this.scans = const [],
    this.filteredScans = const [],
    this.startDate,
    this.endDate,
    this.searchTitle = '',
    this.isLoading = false,
  });

  HistoryState copyWith({
    List<ScanResult>? scans,
    List<ScanResult>? filteredScans,
    DateTime? startDate,
    DateTime? endDate,
    String? searchTitle,
    bool? isLoading,
    bool clearDateRange = false,
  }) {
    return HistoryState(
      scans: scans ?? this.scans,
      filteredScans: filteredScans ?? this.filteredScans,
      startDate: clearDateRange ? null : (startDate ?? this.startDate),
      endDate: clearDateRange ? null : (endDate ?? this.endDate),
      searchTitle: searchTitle ?? this.searchTitle,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get hasActiveFilters =>
      searchTitle.trim().isNotEmpty || (startDate != null && endDate != null);

  @override
  List<Object?> get props => [
    scans,
    filteredScans,
    startDate,
    endDate,
    searchTitle,
    isLoading,
  ];
}
