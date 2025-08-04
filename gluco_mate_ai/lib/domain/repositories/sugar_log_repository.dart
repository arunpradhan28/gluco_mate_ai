import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';


abstract class SugarLogRepository {
  Future<void> addLog(SugarLogModel log);
  Future<List<SugarLogModel>> getLogs();
}
