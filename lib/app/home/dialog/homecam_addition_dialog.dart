import 'package:flutter/material.dart';

class HomecamAdditionDialog extends StatefulWidget {
  final void Function(String serialNumber, void Function() onError)
      onAddButtonClicked;
  final void Function() onCancelButtonClicked;

  const HomecamAdditionDialog({
    super.key,
    required this.onAddButtonClicked,
    required this.onCancelButtonClicked,
  });

  @override
  State<HomecamAdditionDialog> createState() => _HomecamAdditionDialogState();
}

class _HomecamAdditionDialogState extends State<HomecamAdditionDialog> {
  String serialNumber = '';
  bool isSerialNumberError = false;

  void _onSerialNumberChanged(String serialNumber) {
    setState(() {
      this.serialNumber = serialNumber;
    });
  }

  void _onSerialNumberError() {
    setState(() {
      isSerialNumberError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('홈캠 추가'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "시리얼 번호 입력",
              errorText: isSerialNumberError ? '시리얼 넘버가 올바르지 않습니다' : null,
            ),
            onChanged: _onSerialNumberChanged,
          ),
          const SizedBox(height: 16),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.info, size: 24),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '홈캠 추가 요청을 보내면 홈캠 접근 승인 대기 상태가 됩니다.',
                  style: TextStyle(fontSize: 12),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: widget.onCancelButtonClicked,
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () => widget.onAddButtonClicked(
            serialNumber,
            _onSerialNumberError,
          ),
          child: const Text('확인'),
        ),
      ],
    );
  }
}
