import 'package:hive_flutter/hive_flutter.dart';
import 'package:yejing/models/scan_result.dart';

class HiveService {
  static const String boxName = 'scan_results';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(boxName);
  }

  static Future<void> saveScan(ScanResult scan) async {
    final box = Hive.box<String>(boxName);
    await box.put(scan.id, _scanToJson(scan));
  }

  static Future<List<ScanResult>> getAllScans() async {
    final box = Hive.box<String>(boxName);

    if (box.isEmpty) {
      return [];
    }

    return box.values.map((json) => _jsonToScan(json)).toList()
      ..sort((a, b) => b.date.compareTo(a.date)); // Newest first
  }

  static Future<ScanResult?> getScanById(String id) async {
    final box = Hive.box<String>(boxName);
    final json = box.get(id);

    if (json == null) return null;

    return _jsonToScan(json);
  }

  static Future<void> deleteScan(String id) async {
    final box = Hive.box<String>(boxName);
    await box.delete(id);
  }

  static Future<void> clearAllScans() async {
    final box = Hive.box<String>(boxName);
    await box.clear();
  }

  static String _scanToJson(ScanResult scan) {
    final map = scan.toMap();
    return '''{"id":"${map['id']}","imagePath":"${map['imagePath']}","title":"${map['title']}","date":"${map['date']}","severity":"${map['severity']}","description":"${_escapeJson(map['description'])}","treatment":"${_escapeJson(map['treatment'])}"}''';
  }

  static ScanResult _jsonToScan(String json) {
    final Map<String, dynamic> map = _parseJson(json);
    return ScanResult.fromMap(map);
  }

  static Map<String, dynamic> _parseJson(String json) {
    final map = <String, dynamic>{};
    _addToMap(map, 'id', json);
    _addToMap(map, 'imagePath', json);
    _addToMap(map, 'title', json);
    _addToMap(map, 'date', json);
    _addToMap(map, 'severity', json);
    _addToMap(map, 'description', json);
    _addToMap(map, 'treatment', json);

    return map;
  }

  static void _addToMap(Map<String, dynamic> map, String key, String json) {
    final pattern = RegExp('"$key":"([^"\\\\]*(?:\\\\.[^"\\\\]*)*)"');
    final match = pattern.firstMatch(json);
    if (match != null) {
      map[key] = _unescapeJson(match.group(1) ?? '');
    }
  }

  static String _escapeJson(String value) {
    return value
        .replaceAll('\\', '\\\\')
        .replaceAll('"', '\\"')
        .replaceAll('\n', '\\n')
        .replaceAll('\r', '\\r')
        .replaceAll('\t', '\\t');
  }

  static String _unescapeJson(String value) {
    return value
        .replaceAll('\\n', '\n')
        .replaceAll('\\r', '\r')
        .replaceAll('\\t', '\t')
        .replaceAll('\\"', '"')
        .replaceAll('\\\\', '\\');
  }
}
