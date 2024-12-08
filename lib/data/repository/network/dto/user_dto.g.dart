// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      userId: json['identifier'] as String,
      name: json['name'] as String,
      phoneNumber: json['phone_num'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'identifier': instance.userId,
      'name': instance.name,
      'phone_num': instance.phoneNumber,
    };
