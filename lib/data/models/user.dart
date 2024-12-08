import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String userId;
  final String phone;

  const User({
    required this.id,
    required this.name,
    required this.userId,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

const User user1 =
    User(id: 1, name: '홍길동', userId: 'hongari', phone: '010-1234-5678');
