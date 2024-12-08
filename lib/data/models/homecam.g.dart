// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Homecam _$HomecamFromJson(Map<String, dynamic> json) => Homecam(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      serialNumber: json['serialNumber'] as String,
      isAccessable: json['isAccessable'] as bool,
    );

Map<String, dynamic> _$HomecamToJson(Homecam instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'serialNumber': instance.serialNumber,
      'isAccessable': instance.isAccessable,
    };
