class AccessInfo {
  final int accessorId;
  final String homecamSerialNumber;
  final bool isAccessable;

  const AccessInfo({
    required this.accessorId,
    required this.homecamSerialNumber,
    required this.isAccessable,
  });
}

const accessInfo1 = AccessInfo(
  accessorId: 1,
  homecamSerialNumber: '1234567890',
  isAccessable: true,
);

const accessInfo2 = AccessInfo(
  accessorId: 2,
  homecamSerialNumber: '1234567891',
  isAccessable: false,
);
