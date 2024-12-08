import 'package:json_annotation/json_annotation.dart';

part 'homecam.g.dart';

@JsonSerializable()
class Homecam {
  final int id;
  final int userId;
  final String serialNumber;
  final bool isAccessable;

  const Homecam({
    required this.id,
    required this.userId,
    required this.serialNumber,
    required this.isAccessable,
  });

  factory Homecam.fromJson(Map<String, dynamic> json) =>
      _$HomecamFromJson(json);
  Map<String, dynamic> toJson() => _$HomecamToJson(this);
}

const Homecam homecam1 =
    Homecam(id: 1, userId: 1, serialNumber: '1234567890', isAccessable: true);
const Homecam homecam2 =
    Homecam(id: 2, userId: 2, serialNumber: '1234567890', isAccessable: true);
const Homecam homecam3 =
    Homecam(id: 3, userId: 3, serialNumber: '1234567890', isAccessable: true);
