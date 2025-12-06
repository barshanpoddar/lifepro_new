import 'package:lifepro_new/domain/entities/daily_entry.dart';
import 'package:lifepro_new/domain/entities/daily_plan.dart';
import 'package:lifepro_new/domain/entities/user_stats.dart';

abstract class WellbeingRepository {
  Future<void> saveEntry(DailyEntry entry);
  Future<DailyEntry?> getEntry(DateTime date);
  Future<List<DailyEntry>> getHistory();
  Future<void> deleteEntry(String id);

  Future<void> savePlan(DailyPlan plan);
  Future<DailyPlan?> getPlan(DateTime date);

  Future<void> saveStats(UserStats stats);
  Future<UserStats> getStats();
}
