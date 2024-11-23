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

const Homecam homecam1 = Homecam(
    id: 1, name: '홈캠 1', telephone: '010-1234-5678', address: '서울시 강남구');
const Homecam homecam2 = Homecam(
    id: 2, name: '홈캠 2', telephone: '010-1234-5678', address: '서울시 강남구');
const Homecam homecam3 = Homecam(
    id: 3, name: '홈캠 3', telephone: '010-1234-5678', address: '서울시 강남구');
