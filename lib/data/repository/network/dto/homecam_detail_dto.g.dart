// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecam_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomecamDetailDto _$HomecamDetailDtoFromJson(Map<String, dynamic> json) =>
    HomecamDetailDto(
      id: (json['id'] as num).toInt(),
      accessorId: (json['userid'] as num).toInt(),
      serialNumber: json['serialnum'] as String,
      accessorName: json['nickname'] as String,
    );

Map<String, dynamic> _$HomecamDetailDtoToJson(HomecamDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.accessorId,
      'serialnum': instance.serialNumber,
      'nickname': instance.accessorName,
    };
