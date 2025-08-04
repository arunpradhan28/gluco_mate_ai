import 'package:freezed_annotation/freezed_annotation.dart';

part 'sugar_log_model.freezed.dart';
part 'sugar_log_model.g.dart';

@freezed
class SugarLogModel with _$SugarLogModel {
  const factory SugarLogModel({
    required double sugarLevel,
    required DateTime timestamp,
    required String type,
  }) = _SugarLogModel;

  factory SugarLogModel.fromJson(Map<String, dynamic> json) =>
      _$SugarLogModelFromJson(json);
}
