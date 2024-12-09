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
}

const User user1 =
    User(id: 1, name: '홍길동', userId: 'hongari', phone: '010-1234-5678');
