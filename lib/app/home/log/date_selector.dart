import 'package:flutter/material.dart';
import 'package:aneukan/formatter.dart';

class DateSelector extends StatelessWidget {
  final DateTimeRange? selectedDateRange;

  final void Function(DateTimeRange?) onDateRangeChanged;

  const DateSelector({
    super.key,
    required this.selectedDateRange,
    required this.onDateRangeChanged,
  });

  Future<void> _showDateRangePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: selectedDateRange,
    );

    if (picked != null) {
      onDateRangeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(
          selectedDateRange != null
              ? '${formatDate(selectedDateRange!.start)} - ${formatDate(selectedDateRange!.end)}'
              : '날짜 범위 선택',
        ),
        onTap: () => _showDateRangePicker(context),
      ),
    );
  }
}
