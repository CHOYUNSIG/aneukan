import 'package:json_annotation/json_annotation.dart';

part 'homecam_detail_dto.g.dart';

@JsonSerializable()
class HomecamDetailDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'userid')
  final int accessorId;

  @JsonKey(name: 'serialnum')
  final String serialNumber;

  @JsonKey(name: 'nickname')
  final String accessorName;

  const HomecamDetailDto({
    required this.id,
    required this.accessorId,
    required this.serialNumber,
    required this.accessorName,
  });

  factory HomecamDetailDto.fromJson(Map<String, dynamic> json) =>
      _$HomecamDetailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomecamDetailDtoToJson(this);
}
