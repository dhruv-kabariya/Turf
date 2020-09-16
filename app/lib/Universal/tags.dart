import 'package:booking/Universal/chips.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final List<String> tags;

  Tags({@required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map((e) => TagChip(tag: e, background: Colors.deepPurple[100]))
          .toList(),
    );
  }
}
