import 'package:flutter/material.dart';

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
      home: isView ? Scaffold(body: page) : page,
    );
  }
}
