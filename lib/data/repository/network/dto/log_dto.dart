import 'package:json_annotation/json_annotation.dart';

part 'log_dto.g.dart';

@JsonSerializable()
class LogDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'homecamid')
  final int homecamId;
  @JsonKey(name: 'videourl')
  final String videoUrl;
  @JsonKey(name: 'savetime')
  final DateTime timestamp;

  LogDto({
    required this.id,
    required this.homecamId,
    required this.videoUrl,
    required this.timestamp,
  });

  factory LogDto.fromJson(Map<String, dynamic> json) => _$LogDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LogDtoToJson(this);
}
