import 'package:flutter/material.dart';
import 'package:aneukan/data/models/homecam.dart';

class HomecamSelectionDialog extends StatefulWidget {
  final List<Homecam> homecams;

  final void Function(Homecam homecam) onHomecamTapped;
  final void Function() onCancelButtonClicked;

  const HomecamSelectionDialog({
    super.key,
    required this.homecams,
    required this.onHomecamTapped,
    required this.onCancelButtonClicked,
  });

  @override
  State<HomecamSelectionDialog> createState() => _HomecamSelectionDialogState();
}

class _HomecamSelectionDialogState extends State<HomecamSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('홈캠 선택'),
      content: widget.homecams.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '열람 가능한 홈캠이 없습니다',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: widget.homecams
                    .map((homecam) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.home),
                            title: Text(homecam.serialNumber),
                            onTap: () => widget.onHomecamTapped(homecam),
                          ),
                        ))
                    .toList(),
              ),
            ),
      actions: [
        TextButton(
          onPressed: widget.onCancelButtonClicked,
          child: const Text('취소'),
        ),
      ],
    );
  }
}
