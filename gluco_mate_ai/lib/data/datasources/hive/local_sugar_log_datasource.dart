import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:gluco_mate_ai/domain/repositories/sugar_log_repository.dart';
import 'package:hive/hive.dart';


class LocalSugarLogDataSource implements SugarLogRepository {
  final Box<SugarLogModel> box;

  LocalSugarLogDataSource(this.box);

  @override
  Future<void> addLog(SugarLogModel log) async {
    await box.add(log);
  }

  @override
  Future<List<SugarLogModel>> getLogs() async {
    return box.values.toList();
  }
}
