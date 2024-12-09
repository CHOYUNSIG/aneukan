// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecam_access_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomecamAccessDto _$HomecamAccessDtoFromJson(Map<String, dynamic> json) =>
    HomecamAccessDto(
      id: (json['id'] as num).toInt(),
      accessorId: (json['userid'] as num).toInt(),
      serialNumber: json['userhomecam'] as String,
      isAccessable: json['access'] as bool,
    );

Map<String, dynamic> _$HomecamAccessDtoToJson(HomecamAccessDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.accessorId,
      'userhomecam': instance.serialNumber,
      'access': instance.isAccessable,
    };
