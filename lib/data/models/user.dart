class User {
  final String name;
  final String email;
  final String phone;

  const User({
    required this.name,
    required this.email,
    required this.phone,
  });
}

const User user1 =
    User(name: '홍길동', email: 'hong@example.com', phone: '010-1234-5678');
