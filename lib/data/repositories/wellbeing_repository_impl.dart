import 'dart:convert';
import 'package:lifepro_new/core/services/local_storage_service.dart';
import 'package:lifepro_new/domain/entities/daily_entry.dart';
import 'package:lifepro_new/domain/entities/daily_plan.dart';
import 'package:lifepro_new/domain/entities/user_stats.dart';
import 'package:lifepro_new/domain/repositories/wellbeing_repository.dart';

class WellbeingRepositoryImpl implements WellbeingRepository {
  final LocalStorageService _storage;
  final String _boxName = 'wellbeing_entries';

  WellbeingRepositoryImpl(this._storage);

  String _dateKey(DateTime date) => "${date.year}-${date.month}-${date.day}";

  @override
  Future<void> saveEntry(DailyEntry entry) async {
    final key = _dateKey(entry.date);
    await _storage.save(_boxName, key, jsonEncode(entry.toJson()));
  }

  @override
  Future<DailyEntry?> getEntry(DateTime date) async {
    final key = _dateKey(date);
    final data = await _storage.get(_boxName, key);
    if (data != null) {
      return DailyEntry.fromJson(jsonDecode(data));
    }
    return null;
  }

  @override
  Future<List<DailyEntry>> getHistory() async {
    final allData = await _storage.getAll(_boxName);
    return allData.map((e) => DailyEntry.fromJson(jsonDecode(e))).toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  @override
  Future<void> deleteEntry(String id) async {
    // Implementation skipped for MVP as unrelated to current flow
  }

  @override
  Future<void> savePlan(DailyPlan plan) async {
    final key = "plan_${_dateKey(plan.date)}";
    await _storage.save(_boxName, key, jsonEncode(plan.toJson()));
  }

  @override
  Future<DailyPlan?> getPlan(DateTime date) async {
    final key = "plan_${_dateKey(date)}";
    final data = await _storage.get(_boxName, key);
    if (data != null) {
      return DailyPlan.fromJson(jsonDecode(data));
    }
    return null;
  }

  @override
  Future<void> saveStats(UserStats stats) async {
    await _storage.save(_boxName, 'user_stats', jsonEncode(stats.toJson()));
  }

  @override
  Future<UserStats> getStats() async {
    final data = await _storage.get(_boxName, 'user_stats');
    if (data != null) {
      return UserStats.fromJson(jsonDecode(data));
    }
    return const UserStats();
  }
}
