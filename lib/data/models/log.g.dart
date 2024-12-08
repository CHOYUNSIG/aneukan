// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) => Log(
      id: (json['id'] as num).toInt(),
      homecamId: (json['homecamId'] as num).toInt(),
      videoUrl: json['videoUrl'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'id': instance.id,
      'homecamId': instance.homecamId,
      'videoUrl': instance.videoUrl,
      'timestamp': instance.timestamp.toIso8601String(),
    };
