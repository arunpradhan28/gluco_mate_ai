import 'package:flutter/material.dart';
import 'package:gluco_mate_ai/data/models/sugar_log_model.dart';
import 'package:intl/intl.dart';

class SugarLogCard extends StatelessWidget {
  final SugarLogModel log;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const SugarLogCard({
    Key? key,
    required this.log,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  Color _getLevelColor(double level) {
    if (level < 70) return Colors.orange; // low
    if (level > 140) return Colors.red; // high
    return Colors.green; // normal
  }

  @override
  Widget build(BuildContext context) {
    final color = _getLevelColor(log.sugarLevel);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(Icons.opacity, color: color),
        ),
        title: Text(
          '${log.sugarLevel.toStringAsFixed(1)} mg/dL',
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        subtitle: Text(
          '${log.type} • ${DateFormat.yMMMd().add_jm().format(log.timestamp)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEdit != null)
              IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
            if (onDelete != null)
              IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
