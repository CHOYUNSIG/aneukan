import 'package:flutter/material.dart';
import 'package:aneukan/data/models/homecam.dart';

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
                  if (selectedCam!.telephone != null)
                    Text(
                      selectedCam!.telephone!,
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
