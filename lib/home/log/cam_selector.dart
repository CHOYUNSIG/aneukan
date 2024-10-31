import 'package:flutter/material.dart';
import 'package:aneukan/models/homecam.dart';

class CamSelector extends StatelessWidget {
  final Homecam? selectedCam;

  final void Function(Homecam) onCamBarClicked;

  const CamSelector({
    super.key,
    required this.selectedCam,
    required this.onCamBarClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.home),
        title: selectedCam != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedCam!.name),
                  if (selectedCam!.gender != null ||
                      selectedCam!.age != null ||
                      selectedCam!.phone != null)
                    Text(
                      [
                        if (selectedCam!.gender != null) selectedCam!.gender!,
                        if (selectedCam!.age != null) '${selectedCam!.age}세',
                        if (selectedCam!.phone != null) selectedCam!.phone!,
                      ].join(' · '),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  if (selectedCam!.address != null)
                    Text(
                      selectedCam!.address!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                ],
              )
            : const Text('홈캠 선택'),
        onTap: () => onCamBarClicked(selectedCam!),
      ),
    );
  }
}
