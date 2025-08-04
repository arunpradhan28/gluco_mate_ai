import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluco_mate_ai/services/openai_service.dart';
import 'package:intl/intl.dart';

import '../../providers/sugar_log_provider.dart';

// AIzaSyAEil5kw-ORkgowEf0WEU9-BiGb184Z-u8
class SugarLevelChart extends ConsumerWidget {
  const SugarLevelChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(sugarLogProvider);
    if (logs.isEmpty) {
      return const Center(child: Text('No logs to show'));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1.5,
            child: 
            LineChart(
             LineChartData(
  minY: 50,
  maxY: 300,
  lineTouchData: LineTouchData(
    touchTooltipData: LineTouchTooltipData(
      getTooltipItems: (touchedSpots) {
        return touchedSpots.map((spot) {
          final log = logs[spot.x.toInt()];
          return LineTooltipItem(
            '${log.sugarLevel} mg/dL\n${log.type}\n${DateFormat('dd MMM, HH:mm').format(log.timestamp)}',
            const TextStyle(color: Colors.white),
          );
        }).toList();
      },
    ),
  ),
  titlesData: FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 32,
        getTitlesWidget: (value, _) {
          final index = value.toInt();
          if (index < 0 || index >= logs.length) return const SizedBox();
          return Text(DateFormat.Hm().format(logs[index].timestamp), style: const TextStyle(fontSize: 10));
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, _) => Text(value.toInt().toString()),
      ),
    ),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  ),
  gridData: FlGridData(
    show: true,
    drawVerticalLine: true,
    getDrawingHorizontalLine: (_) => FlLine(color: Colors.grey[300], strokeWidth: 1),
    getDrawingVerticalLine: (_) => FlLine(color: Colors.grey[300], strokeWidth: 1),
  ),
  borderData: FlBorderData(show: true),
  lineBarsData: [
    LineChartBarData(
      isCurved: true,
      color: Colors.blue,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(0.3), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      barWidth: 3,
      spots: logs.asMap().entries.map(
        (e) => FlSpot(e.key.toDouble(), e.value.sugarLevel),
      ).toList(),
    ),
  ],
  extraLinesData: ExtraLinesData(
    horizontalLines: [
      // 🟩 Goal range
      HorizontalLine(
        y: 180,
        color: Colors.green,
        strokeWidth: 1.5,
        dashArray: [5, 5],
        label: HorizontalLineLabel(
          show: true,
          labelResolver: (_) => 'Target',
          alignment: Alignment.topRight,
        ),
      ),
      // 🔴 Average line
      HorizontalLine(
        y: logs.map((e) => e.sugarLevel).reduce((a, b) => a + b) / logs.length,
        color: Colors.redAccent,
        strokeWidth: 1.5,
        dashArray: [6, 4],
        label: HorizontalLineLabel(
          show: true,
          labelResolver: (_) => 'Avg',
          alignment: Alignment.topRight,
        ),
      ),
    ],
  ),
)
 ),
          ),
        ),
        const SizedBox(height: 16),
       FutureBuilder<String>(
  future: GeminiService.getAiSuggestions(logs),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('AI Error: ${snapshot.error}');
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Text('No AI suggestions available.');
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🧠 AI Recommendations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(snapshot.data!, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      );
    }
  },
),
  ],
    );
  }
}
