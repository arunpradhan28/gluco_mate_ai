import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/data/datasources/hive/local_sugar_log_datasource.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:hive/hive.dart';


final sugarLogProvider = StateNotifierProvider<SugarLogNotifier, List<SugarLogModel>>((ref) {
  final box = Hive.box<SugarLogModel>('sugar_logs');
  return SugarLogNotifier(LocalSugarLogDataSource(box));
});

class SugarLogNotifier extends StateNotifier<List<SugarLogModel>> {
  final LocalSugarLogDataSource dataSource;

  SugarLogNotifier(this.dataSource) : super([]) {
    loadLogs();
  }

  Future<void> loadLogs() async {
    final logs = await dataSource.getLogs();
    state = logs.reversed.toList(); // show latest first
  }

  Future<void> addLog(SugarLogModel log) async {
    await dataSource.addLog(log);
    await loadLogs();
  }
  void removeLog(SugarLogModel log) {
    state = state.where((l) => l != log).toList();
  }

  void updateLog(SugarLogModel oldLog, SugarLogModel newLog) {
    state = [
      for (final l in state)
        if (l == oldLog) newLog else l,
    ];
  }

  void clearLogs() {
    state = [];
  }
}
