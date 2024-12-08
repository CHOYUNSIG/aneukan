import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable()
class Log {
  final int id;
  final int homecamId;
  final String videoUrl;
  final DateTime timestamp;

  const Log({
    required this.id,
    required this.homecamId,
    required this.videoUrl,
    required this.timestamp,
  });

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
  Map<String, dynamic> toJson() => _$LogToJson(this);
}

final Log log1 = Log(
  id: 1,
  homecamId: 1,
  videoUrl: 'https://example.com/video1.mp4',
  timestamp: DateTime.parse('2024-01-01T16:03:20'),
);

final Log log2 = Log(
  id: 2,
  homecamId: 2,
  videoUrl: 'https://example.com/video2.mp4',
  timestamp: DateTime.parse('2024-03-02T21:16:05'),
);

final Log log3 = Log(
  id: 3,
  homecamId: 3,
  videoUrl: 'https://example.com/video3.mp4',
  timestamp: DateTime.parse('2024-06-13T08:42:15'),
);
