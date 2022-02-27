// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationInfoAdapter extends TypeAdapter<_$_LocationInfo> {
  @override
  final int typeId = 1;

  @override
  _$_LocationInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LocationInfo(
      fields[0] as double,
      fields[1] as double,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LocationInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
