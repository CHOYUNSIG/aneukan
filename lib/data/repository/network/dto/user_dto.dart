import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'identifier')
  final String userId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'phone_num')
  final String phoneNumber;

  const UserDto({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
