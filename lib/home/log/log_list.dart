import 'package:aneukan/formatter.dart';
import 'package:aneukan/log.dart';
import 'package:flutter/material.dart';

class LogList extends StatelessWidget {
  final List<Log> logs;
  final void Function(Log) onLogTapped;

  const LogList({
    super.key,
    required this.logs,
    required this.onLogTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: logs.isEmpty
          ? const Center(
              child: Text(
                '표시할 로그가 없습니다',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              itemCount: logs.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final log = logs[index];
                return LogItem(
                  log: log,
                  onLogTapped: onLogTapped,
                );
              },
            ),
    );
  }
}

class LogItem extends StatelessWidget {
  final Log log;
  final void Function(Log) onLogTapped;

  const LogItem({
    super.key,
    required this.log,
    required this.onLogTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onLogTapped(log),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 시간 정보
            Expanded(
              flex: 2,
              child: Text(
                formatDateTime(log.timestamp),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 아이콘
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
