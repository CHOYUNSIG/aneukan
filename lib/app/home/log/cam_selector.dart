import 'package:flutter/material.dart';
import 'package:aneukan/data/models/homecam.dart';

class CamSelector extends StatelessWidget {
  final Homecam? selectedCam;

  final void Function() onCamBarClicked;

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
                  Text(selectedCam!.serialNumber.toString()),
                ],
              )
            : const Text('홈캠 선택'),
        onTap: onCamBarClicked,
      ),
    );
  }
}
