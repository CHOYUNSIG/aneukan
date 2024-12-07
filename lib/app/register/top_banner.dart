import 'package:flutter/material.dart';
import 'package:aneukan/theme.dart';

class TopBanner extends StatelessWidget {
  final double height;

  const TopBanner({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: brandColor,
      height: height,
      alignment: Alignment.bottomLeft,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '아늑한',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              ': 인공지능 홈캠 낙상 감지 서비스',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
