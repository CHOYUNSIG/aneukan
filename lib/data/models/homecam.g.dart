// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Homecam _$HomecamFromJson(Map<String, dynamic> json) => Homecam(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      telephone: json['telephone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$HomecamToJson(Homecam instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'telephone': instance.telephone,
      'address': instance.address,
      'email': instance.email,
    };
