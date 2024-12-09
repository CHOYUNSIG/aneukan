import 'package:json_annotation/json_annotation.dart';

part 'homecam_access_dto.g.dart';

@JsonSerializable()
class HomecamAccessDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'userid')
  final int accessorId;

  @JsonKey(name: 'userhomecam')
  final String serialNumber;

  @JsonKey(name: 'access')
  final bool isAccessable;

  const HomecamAccessDto({
    required this.id,
    required this.accessorId,
    required this.serialNumber,
    required this.isAccessable,
  });

  factory HomecamAccessDto.fromJson(Map<String, dynamic> json) =>
      _$HomecamAccessDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomecamAccessDtoToJson(this);
}
