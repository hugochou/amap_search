import 'package:flutter/material.dart';

class FunctionItem extends StatelessWidget {
  const FunctionItem({
    Key? key,
    required this.label,
    required this.sublabel,
    required this.target,
    this.isLast = false,
  }) : super(key: key);

  final String label;
  final String sublabel;
  final Widget target;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            sublabel,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => target),
            );
          },
        ),
        isLast ? const SizedBox.shrink() : const Divider(height: 1, indent: 16, color: Colors.white),
      ],
    );
  }
}
