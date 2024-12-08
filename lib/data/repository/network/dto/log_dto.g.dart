// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogDto _$LogDtoFromJson(Map<String, dynamic> json) => LogDto(
      id: (json['id'] as num).toInt(),
      homecamId: (json['homecamid'] as num).toInt(),
      videoUrl: json['videourl'] as String,
      timestamp: DateTime.parse(json['savetime'] as String),
    );

Map<String, dynamic> _$LogDtoToJson(LogDto instance) => <String, dynamic>{
      'id': instance.id,
      'homecamid': instance.homecamId,
      'videourl': instance.videoUrl,
      'savetime': instance.timestamp.toIso8601String(),
    };
