import 'package:hive/hive.dart';
import 'sugar_log_model.dart';

class SugarLogModelAdapter extends TypeAdapter<SugarLogModel> {
  @override
  final int typeId = 0;

  @override
  SugarLogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return SugarLogModel(
      sugarLevel: fields[0] as double,
      timestamp: fields[1] as DateTime,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SugarLogModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.sugarLevel)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.type);
  }
}
