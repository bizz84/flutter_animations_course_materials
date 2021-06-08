// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStateAdapter extends TypeAdapter<TaskState> {
  @override
  final int typeId = 1;

  @override
  TaskState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskState(
      taskId: fields[0] as String,
      completed: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskState obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
