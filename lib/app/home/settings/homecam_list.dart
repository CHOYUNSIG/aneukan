import 'package:flutter/material.dart';
import 'package:aneukan/data/models/homecam.dart';

class HomecamList extends StatelessWidget {
  final List<Homecam> homecams;

  final void Function(Homecam) onHomecamTapped;
  final void Function(Homecam) onDeleteHomecamTapped;
  final void Function() onAddHomecamTapped;

  const HomecamList({
    super.key,
    required this.homecams,
    required this.onHomecamTapped,
    required this.onDeleteHomecamTapped,
    required this.onAddHomecamTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 홈캠 관리 섹션
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '홈캠 관리',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddHomecamTapped,
            ),
          ],
        ),
        const SizedBox(height: 8),

        // 홈캠 리스트
        ...homecams
            .map(
              (homecam) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(homecam.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (homecam.address != null)
                        Text(
                          homecam.address!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      if (homecam.telephone != null)
                        Text(
                          homecam.telephone!,
                          style: const TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => onDeleteHomecamTapped(homecam),
                  ),
                  onTap: () => onHomecamTapped(homecam),
                ),
              ),
            )
            .toList(),

        if (homecams.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '등록된 홈캠이 없습니다',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
