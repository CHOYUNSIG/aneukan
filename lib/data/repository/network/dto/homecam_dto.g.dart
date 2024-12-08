// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomecamDto _$HomecamDtoFromJson(Map<String, dynamic> json) => HomecamDto(
      id: (json['id'] as num).toInt(),
      userId: (json['userid'] as num).toInt(),
      serialNumber: json['userhomecam'] as String,
      isAccessable: json['access'] as bool,
    );

Map<String, dynamic> _$HomecamDtoToJson(HomecamDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userId,
      'userhomecam': instance.serialNumber,
      'access': instance.isAccessable,
    };
