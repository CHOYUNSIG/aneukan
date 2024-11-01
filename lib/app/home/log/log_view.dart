import 'package:aneukan/app/home/log/log_list.dart';
import 'package:aneukan/app/home/log/date_selector.dart';
import 'package:aneukan/app/home/log/cam_selector.dart';
import 'package:aneukan/models/log.dart';
import 'package:flutter/material.dart';
import 'package:aneukan/models/homecam.dart';
import 'package:aneukan/previewer.dart';

class LogView extends StatefulWidget {
  final List<Log> logs;
  final Homecam? selectedCam;
  final DateTimeRange? selectedDateRange;

  final void Function(Homecam) onCamBarClicked;
  final void Function(Log) onLogTapped;
  final void Function(DateTimeRange?) onDateRangeChanged;

  const LogView({
    super.key,
    required this.logs,
    required this.selectedCam,
    required this.selectedDateRange,
    required this.onCamBarClicked,
    required this.onLogTapped,
    required this.onDateRangeChanged,
  });

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CamSelector(
            selectedCam: widget.selectedCam,
            onCamBarClicked: widget.onCamBarClicked,
          ),
          DateSelector(
            selectedDateRange: widget.selectedDateRange,
            onDateRangeChanged: widget.onDateRangeChanged,
          ),
          const SizedBox(height: 16),
          LogList(
            logs: widget.logs,
            onLogTapped: widget.onLogTapped,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    Previewer(
      page: LogView(
        logs: [
          Log(id: 1, timestamp: DateTime.parse('2024-01-01T16:03:20')),
          Log(id: 2, timestamp: DateTime.parse('2024-03-02T21:16:05')),
          Log(id: 3, timestamp: DateTime.parse('2024-06-13T08:42:15')),
        ],
        selectedCam: null,
        selectedDateRange: null,
        onCamBarClicked: (cam) {},
        onLogTapped: (log) {},
        onDateRangeChanged: (dateRange) {},
      ),
    ),
  );
}
