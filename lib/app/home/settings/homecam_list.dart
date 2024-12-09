import 'package:flutter/material.dart';
import 'package:aneukan/data/models/access_info.dart';

class HomecamList extends StatelessWidget {
  final List<AccessInfo> accessInfos;

  final void Function(AccessInfo) onHomecamTapped;
  final void Function() onAddHomecamTapped;

  const HomecamList({
    super.key,
    required this.accessInfos,
    required this.onHomecamTapped,
    required this.onAddHomecamTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          accessInfos.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '등록된 홈캠이 없습니다',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: accessInfos.length,
                  itemBuilder: (context, index) {
                    final accessInfo = accessInfos[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(Icons.home),
                        title: Text(accessInfo.homecamSerialNumber),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              accessInfo.isAccessable ? '접근 허용됨' : '접근 허용 대기중',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => onHomecamTapped(accessInfo),
                        ),
                        onTap: () => onHomecamTapped(accessInfo),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
