import 'package:flutter/material.dart';

class RequirementItem extends StatelessWidget {
  final String name;
  final bool status;
  final VoidCallback callback;

  const RequirementItem({
    super.key,
    required this.name,
    required this.status,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // visualDensity: VisualDensity.compact,
      onTap: status ? null : callback,
      title: Text(name, style: const TextStyle(fontSize: 16)),
      trailing: Icon(
          status ? Icons.check : Icons.error,
          color: status ? Colors.green.shade800 : Colors.yellow.shade800,
          size: 30,
      ),
    );
  }
}
