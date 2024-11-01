class Homecam {
  final int id;
  final String name;
  final String? telephone;
  final String? address;
  final String? email;

  const Homecam({
    required this.id,
    required this.name,
    this.telephone,
    this.address,
    this.email,
  });
}
