import 'homecam.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable()
class Log {
  final int id;
  final Homecam homecam;
  final DateTime timestamp;

  const Log({
    required this.id,
    required this.homecam,
    required this.timestamp,
  });

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
  Map<String, dynamic> toJson() => _$LogToJson(this);
}

final Log log1 = Log(
  id: 1,
  homecam: homecam1,
  timestamp: DateTime.parse('2024-01-01T16:03:20'),
);

final Log log2 = Log(
  id: 2,
  homecam: homecam2,
  timestamp: DateTime.parse('2024-03-02T21:16:05'),
);

final Log log3 = Log(
  id: 3,
  homecam: homecam1,
  timestamp: DateTime.parse('2024-06-13T08:42:15'),
);