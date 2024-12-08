import 'package:json_annotation/json_annotation.dart';

part 'homecam_dto.g.dart';

@JsonSerializable()
class HomecamDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'userid')
  final int userId;

  @JsonKey(name: 'userhomecam')
  final String serialNumber;

  @JsonKey(name: 'access')
  final bool isAccessable;

  const HomecamDto({
    required this.id,
    required this.userId,
    required this.serialNumber,
    required this.isAccessable,
  });

  factory HomecamDto.fromJson(Map<String, dynamic> json) =>
      _$HomecamDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomecamDtoToJson(this);
}
