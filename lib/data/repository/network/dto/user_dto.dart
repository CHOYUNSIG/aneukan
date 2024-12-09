import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'identifier')
  final String accessorId;

  @JsonKey(name: 'name')
  final String accessorName;

  @JsonKey(name: 'phone_num')
  final String accessorPhoneNumber;

  const UserDto({
    required this.id,
    required this.accessorId,
    required this.accessorName,
    required this.accessorPhoneNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
