// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAccountAdapter extends TypeAdapter<UserAccount> {
  @override
  final int typeId = 0;

  @override
  UserAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccount(
      name: fields[0] as String,
      accessToken: fields[1] as String,
      tokenResult: fields[2] as String,
      refreshToken: fields[3] as String,
      email: fields[4] as String,
      provider: fields[5] as String,
      image: fields[6] as String,
      expire: fields[7] as int,
    )..providerExpire = fields[8] as String;
  }

  @override
  void write(BinaryWriter writer, UserAccount obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.tokenResult)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.provider)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.expire)
      ..writeByte(8)
      ..write(obj.providerExpire);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
