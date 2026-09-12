import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yejing/cubits/history/history_state.dart';
import 'package:yejing/services/storage/hive_service.dart';
import 'package:yejing/models/scan_result.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryState());

  Future<void> loadAllScans() async {
    emit(state.copyWith(isLoading: true));
    final List<ScanResult> scans = await HiveService.getAllScans();
    emit(state.copyWith(scans: scans, isLoading: false));
    _applyFilters();
  }

  void filterByDateRange(DateTime start, DateTime end) {
    emit(state.copyWith(startDate: start, endDate: end));
    _applyFilters();
  }

  void filterByTitle(String query) {
    emit(state.copyWith(searchTitle: query));
    _applyFilters();
  }

  void clearFilters() {
    emit(state.copyWith(searchTitle: '', clearDateRange: true));
    _applyFilters();
  }

  Future<void> deleteScan(String id) async {
    await HiveService.deleteScan(id);
    await loadAllScans();
  }

  void _applyFilters() {
    List<ScanResult> results = state.scans;

    if (state.searchTitle.trim().isNotEmpty) {
      final String query = state.searchTitle.trim().toLowerCase();
      results = results
          .where((scan) => scan.title.toLowerCase().contains(query))
          .toList();
    }

    if (state.startDate != null && state.endDate != null) {
      final DateTime start = DateTime(
        state.startDate!.year,
        state.startDate!.month,
        state.startDate!.day,
      );
      final DateTime end = DateTime(
        state.endDate!.year,
        state.endDate!.month,
        state.endDate!.day,
        23,
        59,
        59,
      );
      results = results
          .where(
            (scan) => !scan.date.isBefore(start) && !scan.date.isAfter(end),
          )
          .toList();
    }

    emit(state.copyWith(filteredScans: results));
  }
}
