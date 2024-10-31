import 'package:flutter/material.dart';
import 'package:aneukan/theme.dart';

class Previewer extends StatelessWidget {
  final Widget page;
  final bool isView;

  const Previewer({
    super.key,
    required this.page,
    this.isView = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AneukanTheme.theme,
      home: isView ? Scaffold(body: page) : page,
    );
  }
}
