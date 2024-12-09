// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      accessorId: json['identifier'] as String,
      accessorName: json['name'] as String,
      accessorPhoneNumber: json['phone_num'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'identifier': instance.accessorId,
      'name': instance.accessorName,
      'phone_num': instance.accessorPhoneNumber,
    };
